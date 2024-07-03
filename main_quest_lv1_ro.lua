---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv1 begin
   state start begin
      when login or levelup with pc.get_level() == 1 begin
         set_state( gotoinfomation )
      end
   end
   state gotoinfomation begin
      when letter begin
         send_letter("*Bun venit !")
         q.set_icon("scroll_open_blue.tga")
      end
      when button or info begin
         say_title("Bun venit")
         say_verde("")
         say_albastru2("Bun venit pe Metin2 Serverul Tau, aici te asteapta")
         say_albastru2("o lume Fantastica cu multe surprize la orice")   
         say_albastru2("pas, primejdi, prietenii, aventura, suspans si")
         say_albastru2("e nevoie de mult curaj prin aceste meleaguri.")
         say_albastru2("")
         say_albastru2("Noi iti uram un calduros bine ai venit si dorim")
         say_albastru2("sa ramai aici alaturi de noi, intr-o lume care")
         say_albastru2("multi o credeau disparuta, dar care sa reintors.")
         set_state( gototeacher )
      end
   end

   state gototeacher begin
      when letter begin
         local v=find_npc_by_vnum(20354)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Dute la Gardianul Orasului")
         end
      end
      when letter begin
         send_letter("+Lv 1 - Dute la Gardianul Orasului")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Dute la Gardianul Orasului")
         say_verde("")
         say_verde("Cauta Gardianul Orasului si vorbeste cu el.")
         ----------"12345678901234567890123456789012345678901234567890"|
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")
         say_title("Gardianul Orasului:")

         ----"12345678901234567890123456789012345678901234567890"|
         say_verde("")
         say_verde("Se pare ce esti nou in acest oras")
         say_verde("se vede ca nu stii depsre ce este vb pe aici")
         say_verde("Eu am sa fiu ghidul tau pana ai sa faci putina")
         say_verde("experienta in lupta... Dar am o intrebare ?")
         say_verde("")
         say_verde("Ai folosit vreodata o arma in viata ta ?")
         say_verde("Acest lucru nu este usor si necesita concentrare.")
         say_verde("De aceea eu te voi antrena si iti voi da anumite")
         say_verde("sarcini de indeplinit, intre timp sarcina ta este")
         say_verde("sa castigi experienta luptandu-te cu animalele.")
         wait()
         say_title("Gardianul Orasului:")
         say_verde("")
         say_verde("In drumul tau spre a fi un mare razboinic")
         say_verde("vei invata metode de baza pentru abilitati !")
         say_verde("Combaterea raului si metode de vanatoare,")
         say_verde("odata ce ai ajuns la nivelul urmator haide")
         say_verde("inapoi in sat pentru sarciniile care v-or")
         say_verde("urma sa vina, haide, la treaba !")
         say_verde("")
         say_reward("Recompensa :")
         say_reward("100 Puncte de experienta")
         say_reward("x1 Papuci de piele+6")
         pc.give_item2(15006,1)
         pc.give_exp2( 100 )
         set_quest_state("levelup","run")
         clear_letter()

         set_quest_state("main_quest_lv2","run")
         set_state( __COMPLETE__ )
      end
   end
   state __COMPLETE__ begin
   end
end