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

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }

                field("Created On"; Rec."Created On")
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