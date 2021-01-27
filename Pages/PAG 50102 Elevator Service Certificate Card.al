page 50102 "Elevator Serv. Certif. Card"
{
    Caption = 'Elevator Service Certificate Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Elevator Service Certificate";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Certificate No."; Rec."Certificate Reference No.")
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

                field("Service Date"; Rec."Service Date")
                {
                    ApplicationArea = All;
                }

                field("Service Time"; Rec."Service Time")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }
}