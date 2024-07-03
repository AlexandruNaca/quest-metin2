---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv12 begin
   state start begin
   end
   state run begin
      when login or levelup or enter with pc.get_level() >= 12 begin
         setstate( gototeacher )
      end
      when 20355.chat."Ucide lupii alfa gri" with pc.get_level() <= 12 begin
         say_verde("Capitan:")
         say_verde("")
         say_verde("Capitanul te cauta si are nevoie de tine.")
      end
   end
   state gototeacher begin
      when letter begin
         send_letter("+Lv 12 - Ucide lupii alfa gri")
         q.set_icon("scroll_open_purple.tga")

         local v=find_npc_by_vnum(20355)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Du-te la capitan")
         end
      end
      when button or info begin
         say_title("Ucide lupii alfa gri")
         say_verde("")
         say_verde("Capitanul te cauta si are nevoie de tine.")
         say_verde("Dute la el si vezi cu ce il poti ajuta.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Capitan:")
         say_verde("")
         ---                                                   l
         say_verde("Lupii alfa gri dau tarcoale satului mai nou.")
         say_verde("Satenii sunt speriati si in calitate de lider")
         say_verde("trebuie sa ma ocup de aceasta problema.")
         say_verde("")
         say_reward("Ucide 15 Lupi alfa gri.")
         set_state( killdog )   

         pc.setqf("state", 0)
         q.set_counter("Lupi alfa gri", 0)
      end

   end

   state killdog begin
      when letter begin
         send_letter("+Lv 12 - Ucide lupii alfa gri")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Ucide lupii alfa gri")
         say_verde("")
         say_verde("Capitanul a zis sa omori 15 lupi alfa gri.")

      end
      when 107.kill begin
         local count = pc.getqf("state") + 1

         if count <= 15 then
            pc.setqf("state", count)
            q.set_counter("Lupi alfa gri", 15 - count)

            if count == 15 then
               say_title("Ucude lupii alfa gri")
               say_verde("")
               say_verde("Ai omorat toti cei 15 Lupi alfa gri.")
               say_verde("Acum du-te la capitan si raporteazai.")
               set_state(gototeacher2)
            end
         end
      end
      when 20355.chat."Ucude lupii alfa gri" with pc.getf("main_quest_lv12","state") < 15 begin
         say_title("Capitan:")
         say_verde("")
         say_verde("Du-te si omoara 15 lupi alfa gri, nu")
         say_verde("ti-am explicat deja ce ai de facut ?")

         if pc.is_gm() then
            wait()
            say_verde("Anulez Misiune:")
            say_verde("Sigur vrei sa anulezi aceasta misiune?")
            local s = select("Da", "Nu")
            if s == 1 then
               set_state(gototeacher2)
            end
         end
      end
      when 20355.chat."Am ucis lupi alfa gri" with pc.getf("main_quest_lv12","state") >= 15 begin
         say_title("Capitan:")
         say_verde("")
         say_verde("Multumesc ca te-ai ocupat de aceasta problema.")
         say_verde("Acum cu totii suntem mai linistiti datorita tie.")
         set_state(gototeacher2)
      end
   end
   state gototeacher2 begin
      when letter begin
         local v=find_npc_by_vnum(20355)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Capitan")
         end
      end
      when letter begin
         send_letter("+Lv 12 - Ucide lupii alfa gri")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Ucide lupii alfa gri")
         say_verde("")
         say_verde("Ai omorat cei 15 Lupi alfa gri, acum")
         say_verde("intoarcete la garidan si raporteaza.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Capitan:")
         say_verde("")
         say_verde("Multumesc ca te-ai ocupat de aceasta problema.")
         say_verde("Acum cu totii suntem mai linistiti datorita tie.")
         say_verde("")
         say_reward("Recompensa:")
         say_reward("30.000 Puncte de experienta")
         say_reward("40.000 Yang")
         say_reward("x20 Mantia curajului")
         pc.give_exp2( 30000 )
         pc.change_money( 40000 )
         pc.give_item2( 70038,20 ) 

         clear_letter()
         set_state( __COMPLETE__ )
         set_quest_state("levelup","run")
         set_quest_state("main_quest_lv14", "run")

         pc.setqf("state", 0) --¡V ¦pªG¦A³]©w¥ô°ÈÅÜ¼Æªº¸Ü,  DB ­t²ü¥i¥H¤U­°. 
      end
   end
   state __COMPLETE__ begin
   end
end