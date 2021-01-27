pageextension 50104 SalesOrderListExt extends "Sales Order List"
{
    layout
    {
        addafter("Sell-to Contact")
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