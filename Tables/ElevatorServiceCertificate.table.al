table 50101 "Elevator Service Certificate"
{
    Caption = 'Elevator Service Certificate';
    DataClassification = CustomerContent;
    LookupPageId = "Elevator Serv. Certif. List";
    DrillDownPageId = "Elevator Serv. Certif. List";

    fields
    {
        field(1; "Certificate No."; Code[20])
        {
            Caption = 'Certificate Reference No.';
            DataClassification = CustomerContent;
        }

        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                CalcFields("Customer Name");
            end;
        }

        field(3; "Service Date"; Date)
        {
            Caption = 'Service Date';
            DataClassification = CustomerContent;
        }

        field(4; "Service Time"; Time)
        {
            Caption = 'Service Time';
            DataClassification = CustomerContent;
        }

        field(5; "Elevator Service Description"; Text[250])
        {
            Caption = 'Elevator Service Description';
            DataClassification = CustomerContent;
        }

        field(6; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Editable = false;
        }

        field(7; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }

        field(10; "Created On"; Date)
        {
            Caption = 'Created On';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(11; "Created By"; Text[50])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(12; "Modified On"; Date)
        {
            Caption = 'Modified On';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(13; "Modified By"; Text[50])
        {
            Caption = 'Modified By';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(20; "Elevator Serv. Certif. Posted"; Boolean)
        {
            Caption = 'Posted Certificate';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(21; "Posting Date"; date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
            Editable = false;
        }

    }

    keys
    {
        key(PK; "Certificate No.")
        {
            Clustered = true;
        }

        Key(ServiceDate; "Service Date", "Service Time")
        { }
    }

    trigger OnInsert()
    var
        ElevatorServiceCertificateSetup: record "Elevator Serv. Certif. Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        IF "Certificate No." = '' THEN BEGIN
            ElevatorServiceCertificateSetup.GET;
            ElevatorServiceCertificateSetup.TESTFIELD("Certificate Nos.");
            NoSeriesManagement.InitSeries(ElevatorServiceCertificateSetup."Certificate Nos.", xRec."No. Series", 0D, "Certificate No.", "No. Series");
        END;

        "Created on" := TODAY;
        "Created by" := USERID;
    end;

    trigger OnModify()
    var
        ElevatorServiceCertificateAlreadyPostedErr: Label 'This elevator service certificate has already been invoiced and it could not be modified !';
    begin
        if "Elevator Serv. Certif. Posted" then
            Error(ElevatorServiceCertificateAlreadyPostedErr);
        "Modified on" := TODAY;
        "Modified by" := USERID;
    end;

    trigger OnDelete()
    var
        ElevatorServiceCertificateAlreadyPostedErr: Label 'This elevator service certificate has already been invoiced and it could not be deleted !';
    begin
        if "Elevator Serv. Certif. Posted" then
            Error(ElevatorServiceCertificateAlreadyPostedErr);
    end;

    procedure ShowSalesDocument()
    var
        SalesHeader: record "Sales Header";
        SalesOrder: page "Sales Order";
        SalesInvoice: page "Sales Invoice";
    begin
        SalesHeader.FilterGroup(2);
        SalesHeader.SetRange("Certificate Reference No.", "Certificate No.");
        SalesHeader.FilterGroup(0);
        IF SalesHeader.FindFirst() THEN
            CASE SalesHeader."Document Type" OF
                SalesHeader."Document Type"::Order:
                    BEGIN
                        SalesOrder.SetRecord(SalesHeader);
                        SalesOrder.SetTableView(SalesHeader);
                        SalesOrder.Run;
                    END;
                SalesHeader."Document Type"::Invoice:
                    BEGIN
                        SalesInvoice.SetRecord(SalesHeader);
                        SalesInvoice.SetTableView(SalesHeader);
                        SalesInvoice.Run;
                    END;
            END;
    end;

}