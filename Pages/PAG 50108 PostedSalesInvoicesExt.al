pageextension 50108 PostedSalesInvoicesExt extends "Posted Sales Invoices"
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