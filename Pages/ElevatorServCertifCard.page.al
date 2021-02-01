page 50102 "Elevator Serv. Certif. Card"
{
    Caption = 'Elevator Service Certificate Card';
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = "Elevator Service Certificate";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = All;
                }

                field("Elevator Service Description"; Rec."Elevator Service Description")
                {
                    ApplicationArea = All;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }

                field("Service Date"; Rec."Service Date")
                {
                    ApplicationArea = All;
                }

                field("Service Time"; Rec."Service Time")
                {
                    ApplicationArea = All;
                }

                field("Elevator Serv. Certif. Posted"; Rec."Elevator Serv. Certif. Posted")
                {
                    ApplicationArea = All;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
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
        SalesHeader.SetRange("Certificate Reference No.", Rec."Certificate No.");
        CertificateNotYetPosted := not SalesHeader.IsEmpty;

        SalesInvoiceHeader.SetRange("Certificate Reference No.", Rec."Certificate No.");
        CertificateAlreadyPosted := not SalesInvoiceHeader.IsEmpty;
    end;

    var
        CertificateNotYetPosted: Boolean;
        CertificateAlreadyPosted: Boolean;
}