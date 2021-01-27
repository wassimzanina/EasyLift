pageextension 50103 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Contact")
        {
            field("Certificate Reference No."; Rec."Certificate Reference No.")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }

        }
    }

    actions
    {
    }
}