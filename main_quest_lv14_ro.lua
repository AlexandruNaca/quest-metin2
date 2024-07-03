---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv14 begin
   state start begin
   end
   state run begin
      when login or levelup or enter with pc.get_level() >= 14 begin
         setstate( gototeacher_stone )
      end
      when 20355.chat."Distruge pietrele metin" with pc.get_level() <= 14 begin
         say_verde("Capitan:")
         say_verde("")
         say_verde("Capitanul te cauta si are nevoie de tine.")
      end
   end
   state gototeacher_stone begin
      when letter begin
         send_letter("+Lv 14 - Distruge pietrele metin")
         q.set_icon("scroll_open_purple.tga")

         local v=find_npc_by_vnum(20355)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Du-te la capitan")
         end
      end
      when button or info begin
         say_title("Distruge pietrele metin")
         say_verde("")
         say_verde("Capitanul te cauta si are nevoie de tine.")
         say_verde("Dute la el si vezi cu ce il poti ajuta.")
      end
      when __TARGET__.target.click with pc.get_level() >= 14 begin
         target.delete("__TARGET__")

         say_title("Capitan:")
         say_verde("")
         ---                                                   l
         say_verde("Pietrele metin sun misterioase si periculoase.")
         say_verde("Nu stim de unde cad dar contin magie neagra.")
         say_verde("Este cazul sa facem ceva in privinta asta.")
         say_verde("")
         say_reward("Distruge o Piatra metin ale bataliei.")
         set_state( kill_stone )   

         pc.setqf("state", 0)
         q.set_counter("Piatra metin a bataliei", 0)
      end

   end

   state kill_stone begin
      when letter begin
         send_letter("+Lv 14 - Distruge pietrele metin")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Distruge pietrele metin")
         say_verde("")
         say_verde("Distruge doua Pietre metin ale bataliei.")

      end
      when 8003.kill with pc.get_level() >= 14 begin
         local count = pc.getqf("state") + 1

         if count <= 1 then
            pc.setqf("state", count)
            q.set_counter("Piatra metin a bataliei", 1 - count)

            if count == 1 then
               say_title("Distruge pietrele metin")
               say_verde("")
               say_verde("Ai distrus Piatrele metin ale bataliei.")
               say_verde("Acum du-te la capitan si raporteazai.")
               set_state(gototeacher_stone2)
            end
         end
      end
      when 20355.chat."Distruge pietrele metin" with pc.getf("main_quest_lv14","state") < 1 begin
         say_title("Capitan:")
         say_verde("")
         say_verde("Du-te si distruge 1 Piatre metin ale bataliei,")
         say_verde("nu ti-am explicat deja ce ai de facut ?")

         if pc.is_gm() then
            wait()
            say_verde("Anulez Misiune:")
            say_verde("Sigur vrei sa anulezi aceasta misiune?")
            local s = select("Da", "Nu")
            if s == 1 then
               set_state(gototeacher_stone2)
            end
         end
      end
      when 20355.chat."Am distrus Piatra" with pc.getf("main_quest_lv14","state") >= 1 begin
         say_title("Capitan:")
         say_verde("")
         say_verde("Multumesc ca te-ai ocupat de aceasta problema.")
         set_state(gototeacher_stone2)
      end
   end
   state gototeacher_stone2 begin
      when letter begin
         local v=find_npc_by_vnum(20355)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Capitan")
         end
      end
      when letter begin
         send_letter("+Lv 14 - Distruge pietrele metin")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Distruge pietrele metin")
         say_verde("")
         say_verde("Ai distrus Piatrele metin ale bataliei.")
         say_verde("Acum du-te la capitan si raporteazai.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")
         say_title("Capitan:")
         say_verde("")
         say_verde("Multumesc ca te-ai ocupat de aceasta problema.")
         say_verde("")
         say_reward("Recompensa:")
         say_reward("60.000 Puncte de experienta")
         say_reward("50.000 Yang")
         pc.give_exp2( 60000 )
         pc.change_money( 50000 )

         clear_letter()
         set_state( __COMPLETE__ )
         set_quest_state("levelup","run")
         set_quest_state("main_quest_lv15", "run")
       end
   end
   state __COMPLETE__ begin
   end
end