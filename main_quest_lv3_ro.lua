---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv3 begin
   state start begin

   end
   state run begin
      when login or levelup or enter with pc.get_level() >= 3 begin
         set_state( gototeacher )
      end
      when 20354.chat."Mesaj de la Gardian" begin
         say_verde("")
         say_verde("El te cauta de ceva vreme, e timpul")
         say_verde("sa mergi si sa vorbesti cu el.")
      end
   end
   state gototeacher begin
      when letter begin
         send_letter("+Lv 3 - Mesaj de la Gardian")
         q.set_icon("scroll_open_purple.tga")
         local v=find_npc_by_vnum(20354)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Mesaj de la Gardian")
         end
      end
      when button or info begin
         say_title("Mesaj de la Gardian")
         say_verde("")
         say_verde("El te cauta de ceva vreme, e timpul")
         say_verde("sa mergi si sa vorbesti cu el.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")
         say_title("Gardian:")
         say_verde("")
         say_verde("O cunosti pe negustoarea de diverse ? ")
         say_verde("Ea se ocupa cu comertul de potiuni, iar")
         say_verde("tatal ei cu comertul de armuri.")
         say_verde("")
         say_verde("In sfarsit, dute si vorbeste cu ea, are")
         say_verde("nevoie de o mana de ajutor. ")
         set_state( gotogood )
      end
   end

   state gotogood begin
      when letter begin
         local v=find_npc_by_vnum(9003)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Ajutor pentru negustoare")
         end
      end
      when letter begin
         send_letter("+Lv 3 - Ajutor pentru negustoare")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Ajutor pentru negustoare")
         say_verde("")
         say_verde("Negustoarea de diverse are nevoie de o")
         say_verde("mana de ajutor, dute la ea.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")
         say_title("Magazin General:")
         say_verde("")
         say_verde("Ce greu este in ultima vreme cu comertul de")
         say_verde("licori... Nu mai am timp nici sa imi vizitez")
         say_verde("tatal ca sa nu mai spun de alte lucruri.")
         say_verde("")
         say_verde("Cu toate acestea tatal meu mi-a dat o carte")
         say_verde("si acum trebuie sa o duc inapoi insa nu am")
         say_verde("timp. Te rog sa ii livrezi tu cartea.")
         wait()
         say_title("Magazin General:")
         say_verde("")
         say_verde("Oh, multumesc frumos ca in sfarsit cineva ma")
         say_verde("ajuta, tatal meu nu este departe, dute tot")
         say_verde("inainte si ai sa il vezi, se ocupa cu armuri.")
         say_verde("")
         say_verde("Poftim cartea, te rog dute acum la tata cu ea.")
         say_verde("")
         say_item("Carte de bucate", 69000, "")

         set_state( gotodefend )
      end
   end

   state gotodefend begin
      when letter begin
         local v=find_npc_by_vnum(9002)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Livreaza cartea")
         end
      end
      when letter begin
         send_letter("+Lv 3 - Livreaza cartea")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Livreaza cartea")
         say_verde("")
         say_verde("Negustoarea de diverse a spus sa duci cartea")
         say_verde("de bucate tatalui ei. Grabeste-te si du-o.")
         say_verde("Tatal ei este Vanzatorul de Armuri.")
         say_verde("")
         say_item("Carte de bucate", 69000, "")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Negustorul de armuri")
         say_verde("")
         say_verde("Cu ce ocazie pe la noi razboinicule ?")
         say_verde("")
         say_verde("Inteleg, fiica mea te-a trimis sa imi")
         say_verde("aduci cartea de bucate, oh, dar eu am si")
         say_verde("uitat ca i-am dat cartea aceasta.")
         wait();
         say_title("Negustorul de armuri")
         say_verde("")
         say_verde("Cand ai nevoie de armura, scut sau coif nu")
         say_verde("uita ca eu am un stoc foarte mare si le")
         say_verde("vand la un pret avantajos.")
         say_verde("")
         say_reward("Recompensa:")
         say_reward("800 Puncte de experienta" )
         say_reward("5.000 Yang")
         say_reward("x5 Licoare de viteza de miscare (M)")
         say_reward("x5 Licoare de viteza de atac (M) ")
         pc.give_exp2( 800 )
         pc.change_money( 5000 )
         pc.give_item2(27104,5)
         pc.give_item2(27101,5)
         
         set_quest_state("levelup","run")

         clear_letter()
         set_quest_state("main_quest_lv6", "run")
         set_state( __COMPLETE__ )

      end
   end
   state __COMPLETE__ begin
   end
end