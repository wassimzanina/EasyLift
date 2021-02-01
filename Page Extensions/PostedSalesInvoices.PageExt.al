pageextension 50105 "PostedSalesInvoices" extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Certificate Reference No."; Rec."Certificate Reference No.")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
    }
}