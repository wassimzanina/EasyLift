pageextension 50107 "CustomerLedgerEntries" extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Entry No.")
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