/// @param text_id
//This is ALL the text in the game so good luck finding something down there (there are regions the help navigate, so USE THEM)
function scrGameText(_text_id){

switch (_text_id) {

		case "npc 1": 
		scr_text("* Hi, im npc 1");
		scr_text("* This is a text!");
		scr_text("* This is a very very very very     very very very very long text!");
		scr_text("* And now, a text with a lot of     dots...");
		scr_text("* Lots of dots. . . . . . . . .     . . . .");
		break;
		
		case "npc 1- after interaction":
		scr_text("* Ive already talked to u.         * What else do u want")
		break;
		
		case "npc 1- weed" :
		scr_text("* I AM HAVING A HEART ATTACK!!!")
			scr_shake_text(2, 41)
			scr_text_color(2, 41, c_red, c_red, c_red, c_red)
			scr_text_speed(2, 41, .3, 8)
		break;
		
		case "npc 2": 
		scr_text("* hi, im npc 2");
		scr_text("* this is another text");
		scr_text("* do you like jazz?");
		    scr_option("Yeah", "npc 1 - yes");
			scr_option("Nope", "npc 1 - no");
		break;		
			case "npc 1 - yes" :
			scr_text("* EPIC!!!!!!!!!!!!!!");
			break;
			case "npc 1 - no" :
			scr_text("* Well thats bad :(");
			break;
	    
		
		case "npc 3": 
		scr_text("* Hey kid, im sans.               * SANS THE SKELETON FROM            UNDERTALE", "Sans");
			scr_shake_text(2, 25);
		scr_text("* Hey kid, im sans.               * And now im red", "Sans", c_red);
			scr_text_color(47, 54, c_red, c_red, c_red, c_red)
		scr_text("* Yellow ", "Sans", c_yellow);
			scr_text_color(2, 15, c_yellow, c_yellow, c_yellow, c_yellow)
		scr_text("* Epic green!!!!!!!!!!!!!!", "Sans", c_green);
		scr_text("* Cool lime", "Sans", c_lime);
		scr_text("* Blue", "Sans", c_blue);
		scr_text("* Cool cyan", "Sans", c_aqua);
		scr_text("* Sad grey :(","Sans",c_grey);
		scr_text("* Top!!!","Sans", noone, "Top");
		scr_text("* No box!","Sans","No box");
		scr_text("        * Just text!", noone, "No box");
		break;
		
		
		
		case "Test letter":
		scr_text("* This is a test letter!", noone, noone, "Top");
		break;
		
		case "Test Battle":
		scr_text("* Le epic battle text, now          with its own sound and             everything! ", "Battle Text","No box", "Battle", false, true, fntMain);
			scr_text_color(5, 9, c_yellow, c_yellow, c_yellow, c_yellow);
			scr_float_text(5, 9);
			scr_shake_text(1, 82, 360, 360 * 2);
		break;
		
		case "Pie description":
		scr_text("* A Sus looking pie.               * Recovers all your HP")
		break;
		
		case "Pie pickup text" :
		scr_text("* Looks like a buterscoth pie.     * Will you pick it up?")
			scr_option("Yes", "Pie pickup - yes")
			scr_option("No", "Pie pickup - no")
		break;
			case "Pie pickup - yes":
			objOverworldItem.pick_up_answer = true
			scr_text("* You pick up the pie")
			break;
			case "Pie pickup - no" :
			scr_text("* You leave the pie on the      ground")
			objOverworldItem.pick_up_answer = false
			break;
		
		case "Pie drop text" :
		scr_text("* The pie was thrown away")
		break;
		
		case "Pie use text" :
		scr_text("* You ate the sus pie") 
		if global.Player.HP >= global.Player.MaxHP
		{
		scr_text("* Your HP was maxed out!")
		}
		break;

		case "Shop test":
		scr_text("* Welcome to the       test shop!", noone ,"No box", "Shop", false, false, fntBig);
			scr_break_line(20, 20)
		break;
		
		case "Shop test - buy":
		scr_text("what you gonna buy?", noone, "No box", "Shop - buy")
			scr_break_line(8,8)
		break;
		
		case "Shop - test - talk 1" :
		scr_text("* Well, theres no sprites to work    with.", noone, "No box", "Shop")
		scr_text("* And theres still no spriter     nor artist", noone, "No box", "Shop")
		scr_text("* So enjoy watching the black void", noone, "No box", "Shop")
		break;
		
		case "Shop - test - talk" :
		scr_text("Talk? Sure, why not.", noone, "No box", "Shop - buy", false, false);
			scr_break_line(5,5)
			scr_break_line(11,11)
		break;

		case "Shop - test - confirm":
		scr_text("This one?", noone, "No box", "Shop - buy", false)
		break;
		
		case "Shop - test - thanks":
		scr_text("Thanks for your donation!", noone, "No box", "Shop - buy", false)
		    scr_break_line(10,10)
			scr_break_line(15,15)
		break;
		
		case "Shop - test - goodbye":
		scr_text("Bye bye!", noone, "No box", "Shop", false)
		break;
		
		case "Battle - won" :
		scr_text("* YOU WON! * You earned " + objBulletBoard.EXP_string + " XP and " + objBulletBoard.gold_string + " gold.", "Battle Text", "No box", "Battle", false, false); 
		scr_break_line(11,11)
		break;
		
		case "Test dummy - check" :
		scr_text("* TEST DUMMY - ATK " + string(global.Monster.TestSubject.MonsterATK) + " DEF " + string(global.Monster.TestSubject.MonsterDEF) + " * A dummy for testing purposes", "Battle Text", "No box", "Battle", true, false); 
		scr_break_line(29, 29)
		break;
		
		case "Test dummy - scream" :
		scr_text("* You scream as loud as you can...", "Battle Text", "No box", "Battle", true, true);
		scr_text("* The dummy ignores you", "Battle Text", "No box", "Battle", true, true);
		break;
		
		case "Test dummy - scream 2" :
		scr_text("* You scream as loud as you can...", "Battle Text", "No box", "Battle", true, true);
		scr_text("* The dummy gets tired of your screaming!", "Battle Text", "No box", "Battle", true, true);
		scr_text("* Dummy's attack UP!", "Battle Text", "No box", "Battle", true, true);
		break;
		
		case "Test monster - check" :
		scr_text("* TEST MONSTER - ATK " + string(global.Monster.TestMonster.MonsterATK) + " DEF " + string(global.Monster.TestMonster.MonsterDEF) + " * Just another test monster", "Battle Text", "No box", "Battle", true, false); 
		break;
		
		case "Test monster - ignore" :
		scr_text("* You ignore the poor monster", "Battle Text", "No box", "Battle", true, true);
		scr_text("* They dont seem to care", "Battle Text", "No box", "Battle", true, true);
		break;
		
		case "Test monster - ignore 2" :
		scr_text("* You keep ignoring the monster", "Battle Text", "No box", "Battle", true, true);
		scr_text("* They start to get a little angry", "Battle Text", "No box", "Battle", true, true);
		scr_text("* Their attack increses", "Battle Text", "No box", "Battle", true, true);
		break;
		
		case "Test monster - ignore 3" :
		scr_text("* You ignore the monster one more time", "Battle Text", "No box", "Battle", true, true);
		scr_text("* They give up on you", "Battle Text", "No box", "Battle", true, true);
		break;

		case "Test monster - ignore 4" :
		scr_text("* They dont seem to care anymore", "Battle Text", "No box", "Battle", true, true);
		break;
		
		case "Game over" :
		scr_text("Damn u suck", noone, "No box", "Battle", false, false);
		break;
		
		case "test cutscene" :
		scr_text("* Hey! watch your step, kid!");
		scr_text("* Couldnt you see this 0 pixel frog?");
		break;

		case "test cutscene 2" :
		scr_text("* There is nothing out there but an endless black void");
		scr_text("* You hear something in the distance call out your name...");
		scr_text("* Maybe its time to get back to work.");
		break;
		
		default:
		scr_text("* No text found within this case!  *	Make sure you tipped it correctly")
		break;
		


}

}