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
        text: "Mogak 'NameKeeper' Thulg"
        font.pointSize: 25
        font.bold: true
    }

    HealthBar {
        id: hpBar
        anchors.horizontalCenter: parent.horizontalCenter
        width: 700
        height: 50
        z: 10
        maxHP: 34

        ShieldNumber {
            anchors.horizontalCenter: hpBar.left
            anchors.verticalCenter: hpBar.verticalCenter
            anchors.rightMargin: 10
            armorClass: 16
        }
    }


    Row { // 3 detail columns
        spacing: 8
        anchors.horizontalCenter: parent.horizontalCenter

        Grid { // Column 1
            rows: 6
            columns: 1
            spacing: 2

            StatBlock {
                name: "Strength"
                value: 18
                skills.model: ["Athletics"]
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Dexterity"
                value: 5
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Constitution"
                value: 18
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Intelligence"
                value: 10
                skills.model: ["History"]
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Wisdom"
                value: 13
                skills.model: ["Saving Throws", "Insight"]
                prociciencyBonus: 2
            }
            StatBlock {
                name: "Charisma"
                value: 16
                skills.model: ["Saving Throws", "Intimidation", "Persuasion"]
                prociciencyBonus: 2
            }
        }

        Column { // Column 2
            spacing: 8
            UsesTracker {
                uses: 3
                titleText: "Hit Dice"
                iconText: "d10"
                availableColor: "#F08080"
            }

            UsesTracker {
                uses: 3
                titleText: "Spells"
                iconText: "Lvl 1"
            }

            AttackRoll {
                attackName: "Maul"
                damageDice: "2d6"
                footNote: "Reroll 1s and 2s on damage"
                proficiencyBonus: 2
                statBonus: 4
            }

            AttackRoll {
                attackName: "T. Hammer"
                damageDice: "1d6"
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
                    text: "Spell Details"
                    font.pointSize: 13
                    font.bold: true
                    anchors.centerIn: parent
                    horizontalAlignment: Text.Center
                }
            }
            SpellInfo {
                spellName: "Command"
                details: "
                    <b>Standard Action</b><br>
                    60 ft<br>
                    Components: V<br>
                    Duration: 1 round<br>
                    <b>Effect:</b>  Yell a word at someone.  They do a WIS saving throw or must obey the word.<br>
                    <b>The full text:</b><br>
                    You speak a one-word command to a creature you can see within range. The target must succeed on a Wisdom saving throw or follow the command on its next turn. The spell has no effect if the target is undead, if it doesn’t understand your language, or if your command is directly harmful to it. Some typical commands and their effects follow. You might issue a command other than one described here. If you do so, the GM determines how the target behaves. If the target can’t follow your command, the spell ends. Approach. The target moves toward you by the shortest and most direct route, ending its turn if it moves within 5 feet of you. Drop. The target drops whatever it is holding and then ends its turn. Flee. The target spends its turn moving away from you by the fastest available means. Grovel. The target falls prone and then ends its turn. Halt. The target doesn’t move and takes no actions. A flying creature stays aloft, provided that it is able to do so. If it must move to stay aloft, it flies the minimum distance needed to remain in the air."

            }
            SpellInfo {
                spellName: "Bless"
                details: "
                    <b>Standard Action</b><br>
                    30 ft<br>
                    V,S,M (a sprinkling of holy water)<br>
                    Duration: Concentration, up to 1 minute<br>
                    <b>Effect:</b> 3 targets - +1d4 on Attack/Saving throw rolls<br>
                    <b>The full text:</b><br>
                    You bless up to three creatures of your choice within range. Whenever a target makes an attack roll or a saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw."
            }
            SpellInfo {
                spellName: "Bane"
                details: "
                    <b>Standard Action</b><br>
                    30 ft<br>
                    V,S,M (a drop of blood)<br>
                    Duration: Concentration, up to 1 minute<br>
                    <b>Effect:</b> 3 targets - CHA save: -1d4 on Attack/Saving throw rolls<br>
                    <b>The full text:</b><br>
                    Up to three creatures of your choice that you can see within range must make Charisma saving throws. Whenever a target that fails this saving throw makes an attack roll or a saving throw before the spell ends, the target must roll a d4 and subtract the number rolled from the attack roll or saving throw."
            }

            Rectangle
            {
                height: 40
                width: 200
                border.width: 1
                color: "light grey"
                Text {
                    text: "Abilities"
                    font.pointSize: 13
                    font.bold: true
                    anchors.centerIn: parent
                    horizontalAlignment: Text.Center
                }
            }
            LayOnHands {
                z:10
            }
            SpellInfo {
                spellName: "Abjure"
                details: "
                    <b>Standard Action</b><br>
                    60 ft<br>
                    V,S,M (Holy Symbol)<br>
                    Duration: 1 minute<br>
                    <b>Effect:</b> 1 target - WIS save: (fail) Frightened & Speed 0. (succeed) half speed.  Effect ends when target takes damage<br>
                    <b>The full text:</b><br>
                    As an action, you present your holy symbol and speak a prayer of denunciation, using your Channel Divinity. Choose one creature within 60 feet of you that you can see. That creature must make a Wisdom saving throw, unless it is immune to being frightened. Fiends and undead have disadvantage on this saving throw.
                    On a failed save, the creature is frightened for 1 minute or until it takes any damage. While frightened, the creature's speed is 0, and it can't benefit from any bonus to its speed.
                    On a successful save, the creature's speed is halved for 1 minute or until the creature takes any damage."
            }
            SpellInfo {
                spellName: "Vow of Enmity"
                details: "
                    <b>Bonus Action</b><br>
                    10 ft<br>
                    V<br>
                    Duration: 1 minute<br>
                    <b>Effect:</b> 1 target - Gain advantage on attacks vs target<br>
                    <b>The full text:</b><br>
                    As a bonus action, you can utter a vow of enmity against a creature you can see within 10 feet of you, using your Channel Divinity. You gain advantage on attack rolls against the creature for 1 minute or until it drops to 0 hit points or falls unconscious."
            }

            SpellInfo {
                spellName: "Stones Endurance"
                details: "
                    <b>Reaction</b><br>
                    <b>Effect:</b> Reduce incoming damage by 1d12+CON<br>
                    <b>The full text:</b><br>
                    You can focus yourself to occasionally shrug off injury. When you take damage, you can use your reaction to roll a d12. Add your Constitution modifier to the number rolled, and reduce the damage by that total. After you use this trait, you can’t use it again until you finish a short or long rest."
                statusTracker.children:
                    UsedBox {
                        id: pool
                        size: 30
                    }
            }
            SpellInfo {
                spellName: "Divine Sense"
                details: "
                    <b>Standard Action</b><br>
                    60 ft<br>
                    <b>Effect:</b> You can smell evil and good<br>
                    <b>The full text:</b><br>
                    The presence of strong evil registers on your senses like a noxious odor, and powerful good rings like heavenly music in your ears. As an action, you can open your awareness to detect such forces. Until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet of you that is not behind total cover. You know the type (celestial, fiend, or undead) of any being whose presence you sense, but not its identity (the vampire Count Strahd von Zarovich, for instance). Within the same radius, you also detect the presence of any place or object that has been consecrated or desecrated, as with the hallow spell.
                    You can use this feature a number of times equal to 1 + your Charisma modifier. When you finish a long rest, you regain all expended uses.
                    "
            }
        }
    }

    Text {
        width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.Center
        textFormat: Text.StyledText
        font.pointSize: 12
        text: '<b>Catch phrases</b><br>
                    "I am just the bridge between life and death.  You were the one to cross me."<br>
                    "Consider what to say to your god.  You will meet them soon.""<br>

                    '
    }
}
