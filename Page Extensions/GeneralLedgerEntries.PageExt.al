pageextension 50106 "GeneralLedgerEntries" extends "General Ledger Entries"
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