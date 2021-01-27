page 50100 "Elevator Serv. Certif. Setup"
{
    Caption = 'Elevator Service Certificate Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "Elevator Serv. Certif. Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Certificate Nos."; Rec."Certificate Nos.")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;
    end;
}