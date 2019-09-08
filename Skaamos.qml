import QtQuick 2.0

Column
{
    spacing: 8

    // Header
    Text {
        height: 60
        width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.Center
        text: "Skaamos"
        font.pointSize: 25
        font.bold: true
    }

    HealthBar {
        id: hpBar
        anchors.horizontalCenter: parent.horizontalCenter
        width: 700
        height: 50
        z: 10
        maxHP: 25

        ShieldNumber {
            id: acBox
            anchors.horizontalCenter: hpBar.left
            anchors.verticalCenter: hpBar.verticalCenter
            anchors.rightMargin: 10
            armorClass: 17
        }

        Text {
            id: extraHP
            text: "   *" + "Fire resistance & 60ft Darkvision"
            font.pointSize: 10
            anchors.top: acBox.bottom
            anchors.left: acBox.left
        }
    }

    Rectangle { // DUmmy spacer
        width:1;
        color: "transparent";
        height:2
    }

    Row { // 3 detail columns
        spacing: 8
        anchors.horizontalCenter: parent.horizontalCenter

        Grid { // Column 1
            rows: 7
            columns: 1
            spacing: 2
            MoveSpeed {
                moveSpeed: 40
            }
            StatBlock {
                name: "Strength"
                value: 12
                skills.model: ["Saving Throws"]
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Dexterity"
                value: 18
                skills.model: ["Saving Throws", "Acrobatics", "Stealth"]
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Constitution"
                value: 13
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Intelligence"
                value: 6
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Wisdom"
                value: 15
                skills.model: ["Animal handling", "Survival",]
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Charisma"
                value: 12
                skills.model: ["Saving Throws", "Intimidation", "Persuasion"]
                prociciencyBonus: 2
            }
        }

        Column { // Column 2
            spacing: 8
            UsesTracker {
                uses: 3
                titleText: "Hit Dice"
                iconText: "d8"
                availableColor: "#F08080"
            }

            UsesTracker {
                uses: 3
                titleText: "Ki Points"
                iconText: ""
                availableColor: "gold"
            }

            AttackRoll {
                attackName: "Spear"
                damageDice: "1d8"
                footNote: "1d6 if one-handed"
                proficiencyBonus: 2
                statBonus: 4
            }

            AttackRoll {
                attackName: "Unarmed"
                damageDice: "1d4"
                footNote: "Bonus action after Attack"
                proficiencyBonus: 2
                statBonus: 4
            }

            AttackRoll {
                attackName: "Dart"
                damageDice: "1d4"
                footNote: "Range: 20/60"
                proficiencyBonus: 2
                statBonus: 4
            }

        }

        Column { // Column 3
            spacing: 8
            Behavior on width { PropertyAnimation { duration: 500 } }



            Rectangle
            {
                height: 40
                width: 200
                border.width: 1
                color: "light grey"
                Text {
                    text: "Monk Abilities"
                    font.pointSize: 13
                    font.bold: true
                    anchors.centerIn: parent
                    horizontalAlignment: Text.Center
                }
            }
            SpellInfo {
                spellName: "Flurry of Blows"
                details: "
                    <b>Bonus Action: 1 Ki</b><br>
                    <b>Effect:</b>  After taking an attack action, make two unarmed strikes as a bonus action<br>
                    On hits, choose one:<br>
                    -Dex saving throw: knocked prone<br>
                    -Str saving throw: pushed 15ft<br>
                    -No reactions until next turn<br><br>
                    <b>The full text:</b><br>
                    Immediately after you take the Attack action on your turn, you can spend 1 ki point to make two unarmed strikes as a bonus action.  Starting when you choose this tradition at 3rd level, you can manipulate your enemy’s ki when you harness your own. Whenever you hit a creature with one of the attacks granted by your Flurry of Blows, you can impose one of the following effects on that target:<br>
It must succeed on a Dexterity saving throw or be knocked prone.<br>
It must make a Strength saving throw. If it fails, you can push it up to 15 feet away from you.<br>
It can’t take reactions until the end of your next turn."

            }
            SpellInfo {
                spellName: "Step of the Wind"
                details: "
                    <b>Bonus Action: 1 Ki</b><br>
                    <b>Effect:</b>Disengage or Dash. Jump distance is doubled for the turn.<br>
                    Disengage- Your movement this turn doesn’t provoke Opportunity attacks<br>
                    Dash- Double your speed this turn (after modifiers).<br><br>
                    <b>The full text:</b><br>
You can spend 1 ki point to take the Disengage or Dash action as a bonus action on your turn, and your jump distance is doubled for the turn.
                    "
            }
            SpellInfo {
                spellName: "Patient Defense"
                details: "
                    <b>Bonus Action: 1 Ki</b><br>
                    <b>Effect:</b>Take dodge action. Advantage on dex saves. Incoming attacks disadvantage<br><br>
                    <b>The full text:</b><br>
                    Until the start of your next turn, attacks against you have disadvantage if you can see them and Dex saving throws have advantage.
                    "
            }
            SpellInfo {
                spellName: "Deflect Missiles"
                details: "
                    <b>Reaction</b><br>
                    <b>Effect:</b>When hit by a ranged attack reduce the damage by 1d10 + Dex + monk level. Reduced to 0?  You catch it.<br>
                    <b>Extra:</b> If you catch it, spend a ki point to throw it back (with proficiency)<br><br>
                    <b>The full text:</b><br>
Starting at 3rd level, you can use your reaction to deflect or catch the missile when you are hit by a ranged weapon attack. When you do so, the damage you take from the attack is reduced by 1d10 + your Dexterity modifier + your monk level.<br><br>

If you reduce the damage to 0, you can catch the missile if it is small enough for you to hold in one hand and you have at least one hand free. If you catch a missile in this way, you can spend 1 ki point to make a ranged attack with the weapon or piece of ammunition you just caught, as part of the same reaction. You make this attack with proficiency, regardless of your weapon proficiencies, and the missile counts as a monk weapon for the attack, which has a normal range of 20 feet and a long range of 60 feet.
                    "
            }

            Text {
                width: 1
                textFormat: Text.StyledText
                font.pointSize: 10
                text:
        '<b>Other junk:</b><br>
        1 spear<br>
        1 spoon<br>
        Backpack<br>
        Shovel<br>
        Rope<br>
        20x Silver darts<br>
        4 caltrops<br>
        1 health potion<br>
        1 ring of protection<br>
        '
            }
        }
        // editable text. inspiration counter. animation fix.
        // data driven model
    }


}
