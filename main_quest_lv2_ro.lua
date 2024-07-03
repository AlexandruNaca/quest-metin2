---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv2 begin
   state start begin
   end
   state run begin
      when login or levelup or enter with pc.get_level() >= 2 begin
         setstate( gototeacher )
      end
      when 20354.chat."Scrisoare de la Gardian" with pc.get_level() <= 2 begin
         say_title("Scrisoare de la Gardianul Orasului:")
         say_verde("")
         say_verde("Gardianul orasului te cauta si are nevoie de")
         say_verde("tine. El este instructorul tau asa ca el are")
         say_verde("cateva sarcini pentru tine, dute la el acum.")
      end
   end
   state gototeacher begin
      when letter begin
         send_letter("+Lv 2 - Scrisoare de la Gardian")
         q.set_icon("scroll_open_purple.tga")

         local v=find_npc_by_vnum(20354)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Du-te la gardian")
         end
      end
      when button or info begin
         say_title("Scrisoare de la Gardian")
         say_verde("")
         say_verde("Daca vei citi acest manuscris ai atins")
         say_verde("deja un nivel potrivit si ai acumulat")
         say_verde("putina experienta. Foarte bine, felicitari.")
         say_verde("Acum te asteapta Gardianul Orasului!")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Scrisoare de la Gardian")
         say_verde("")
         ---                                                   l
         say_verde("Vino aici, am o sarcina pentru tine pentru")
         say_verde("inceput. Ai vazut acei caini salbatici ?")
         say_verde("")
         say_verde("Satenii stiu ca nu sunt un pericol mare pentru")
         say_verde("satul nostru, insa este o oportunitate pentru")
         say_verde("tine sa castigi experienta in lupta.")
         wait()
         say_title("Gardian:")
         say_verde("")
         say_verde("Sarcina ta este sa omori 15 caini salbatici.")
         say_verde("Cand ai terminat intoarcete la mine insa ai")
         say_verde("grija sa nu te ranesti, fi concentrat mereu.")
         set_state( killdog )   

         pc.setqf("state", 0)
         q.set_counter("Caini Salbatici", 0)
      end

   end

   state killdog begin
      when letter begin
         send_letter("+Lv 2 - Primul exercitiu")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Primul Exercitiu")
         say_verde("")
         say_verde("Omoara 15 caini salbatici.")
      end
      when 101.kill begin
         local count = pc.getqf("state") + 1

         if count <= 15 then
            pc.setqf("state", count)
            q.set_counter("Caini Salbatici", 15 - count)

            if count == 15 then
               say_title("Exercitiu Finalizat")
               say_verde("")
               say_verde("Ai omorat toti cei 15 caini salbatici")
               say_verde("Acum du-te la Gardian si raporteazai.")
               set_state(gototeacher2)
            end
         end
      end
      when 20354.chat."Exercitiu Finalizat" with pc.getf("main_quest_lv2","state") < 15 begin
         say_title("Gardian:")
         say_verde("")
         say_verde("Du-te si omoara 15 cain salbatici, nu")
         say_verde("ti-am explicat deja ce ai de facut ?")

         if pc.is_gm() then
            wait()
            say_verde("Gardian:")
            say_verde("Sigur vrei sa anulezi aceasta misiune?")
            local s = select("Da", "Nu")
            if s == 1 then
               set_state(gototeacher2)
            end
         end
      end
      when 20354.chat."Gardian" with pc.getf("main_quest_lv2","state") >= 15 begin
         say_title("Gardian:")
         say_verde("")
         say_verde("A fost usor pentru tine ? Felicitari, ai")
         say_verde("facut o treaba buna. Se pare ca nu m-ai")
         say_verde("dezamagit, esti pe drumul cel bun.")
         set_state(gototeacher2)
      end
   end
   state gototeacher2 begin
      when letter begin
         local v=find_npc_by_vnum(20354)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Gardian")
         end
      end
      when letter begin
         send_letter("+Lv 2 - Misiune finalizata")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Misiune Finalizata")
         say_verde("")
         say_verde("Ai omorat cei 15 Caini Salbatici, acum")
         say_verde("intoarcete la garidan si raporteaza.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Gardian:")
         say_verde("")
         say_verde("A fost usor pentru tine ? Felicitari, ai")
         say_verde("facut o treaba buna. Se pare ca nu m-ai")
         say_verde("dezamagit, esti pe drumul cel bun.")
         say_verde("")
         say_reward("Recompensa:")
         say_reward("300 Puncte de experienta")
         say_reward("2.000 Yang")
         say_reward("x50 Licori rosii (M)")
         say_reward("x50 Licori albastre (M)")
         pc.give_exp2( 300 )
         pc.change_money( 2000 )
         pc.give_item2( 27002 ,50 ) 
         pc.give_item2( 27005 ,50 ) 
         set_quest_state("levelup","run")

         clear_letter()
         set_state( __COMPLETE__ )
         set_quest_state("main_quest_lv3", "run")

         pc.setqf("state", 0) --¡V ¦pªG¦A³]©w¥ô°ÈÅÜ¼Æªº¸Ü,  DB ­t²ü¥i¥H¤U­°. 
      end
   end
   state __COMPLETE__ begin
   end
end