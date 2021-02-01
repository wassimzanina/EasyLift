page 50101 "Elevator Serv. Certif. List"
{
    Caption = 'Elevator Service Certificate List';
    PageType = List;
    CardPageId = "Elevator Serv. Certif. Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Elevator Service Certificate";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = CertificateStyle;
                }

                field("Elevator Service Description"; Rec."Elevator Service Description")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = CertificateStyle;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = CertificateStyle;
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = CertificateStyle;
                }

                field("Service Date"; Rec."Service Date")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = CertificateStyle;
                }

                field("Service Time"; Rec."Service Time")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = CertificateStyle;
                }

                field("Elevator Serv. Certif. Posted"; Rec."Elevator Serv. Certif. Posted")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = CertificateStyle;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = CertificateStyle;
                }

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(ShowSalesDocument)
            {
                Caption = 'Show Sales Document';
                ApplicationArea = All;
                //Promoted = true;
                //PromotedIsBig = true;
                Image = Document;
                Enabled = CertificateNotYetPosted;
                RunPageMode = View;

                trigger OnAction()
                begin
                    Rec.ShowSalesDocument();
                end;
            }

            action(ShowPostedSalesInvoice)
            {
                Caption = 'Show Posted Sales Invoice';
                ApplicationArea = All;
                //Promoted = true;
                //PromotedIsBig = true;
                Image = SalesInvoice;
                Enabled = CertificateAlreadyPosted;
                RunObject = Page "Posted Sales Invoice";
                RunPageLink = "Certificate Reference No." = field("Certificate No.");
                RunPageMode = View;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        SalesHeader: record "Sales Header";
        SalesInvoiceHeader: record "Sales Invoice Header";
    begin
        CertificateStyle := Rec."Elevator Serv. Certif. Posted";

        SalesHeader.SetRange("Certificate Reference No.", Rec."Certificate No.");
        CertificateNotYetPosted := not SalesHeader.IsEmpty;

        SalesInvoiceHeader.SetRange("Certificate Reference No.", Rec."Certificate No.");
        CertificateAlreadyPosted := not SalesInvoiceHeader.IsEmpty;
    end;

    var
        CertificateNotYetPosted: Boolean;
        CertificateAlreadyPosted: Boolean;
        CertificateStyle: Boolean;
}