---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv9 begin
   state start begin
   end
   state run begin
      when login or levelup or enter with pc.get_level() >= 9 begin
         set_state( gotosmith )      
      end
   end
   state gotosmith begin
      when letter begin
         local v=find_npc_by_vnum(20016)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Fierar")
         end
      end
      when letter begin
         send_letter("+Lv 9 - Vorbeste cu Fierarul")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Vorbeste cu Fierarul")
         say_verde("")
         say_verde("Fierarul are nevoie de tine din nou.")
         say_verde("Dute si vorbeste cu el, grabeste-te.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")
         say_title("Fierar:")
         say_verde("")
         say_verde("Am nevoie sa livrezi Pescarului o undita")
         say_verde("care mi-a dato sa o imbunatatesc insa nu")
         say_verde("am reusit. Acum trebuie sa o dau inapoi")
         say_verde("insa sunt foarte ocupat, faci tu asta ?")
         wait()
         say_title("Fierar:")
         say_verde("")
         say_verde("Multumesc, poftim undita. Dute la Pescar.")
         setstate( gotofisher )
         q.done()
      end
   end


   state gotofisher begin
      when letter begin
         send_letter("+Lv 9 - Dute la Pescar")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Dute la Pescar")
         say_verde("")
         say_verde("Du pescarului Undita+1 care ti-a dat-o")
         say_verde("Fierarul satului, grabeste-te.")
      end
      when 20016.chat."Undita pentru Pescar" begin
         say_title("Fierar:")
         say_verde("")
         say_verde("De ce esti inca aici ? Ti-am mai spus o")
         say_verde("data, dute cu Undita+1 la Pescar.")
      end
      when 9009.chat."Undita+1 de la Fierar"  begin
         say_title("Pescar:")
         say_verde("")
         say_verde("Multumesc ca mi-ai adus Undita, am nevoie")
         say_verde("pe stoc ca sa vand pentru viitori pescari")
         say_verde("care o sa vina prin zona la pescuit.")
         wait()
         say_title("Pescar")
         say_verde("")
         say_verde("Ai nevoie de nivel 30, Undita si momeala.")
         say_verde("Nu este greu, pui momeala in ac si arunci")
         say_verde("dupa care cand vezi ca ai prins tragi pestele.")
         say_verde("")
         say_verde("Poti prinde pesti pe care daca-i deschizi ai")
         say_verde("sansa sa obtii Scoici sau Cufar Acvatic.")
         wait()
         say_title("Pescar:")
         say_verde("")
         say_verde("Multumesc pentru timpul acordat. Acum dute")
         say_verde("inapoi la Fierar si raporteaza totul.")
         set_state( gotosmith2 )
      end
   end
   state gotosmith2 begin
      when letter begin
         local v=find_npc_by_vnum(20016)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Inapoi la Fierar")
         end
      end
      when letter begin
         send_letter("+Lv 9 - Inapoi la Fierar")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Inapoi la Fierar")
         say_verde("")
         say_verde("Ai rezolvat cu Pescarul, acum dute la")
         say_verde("Fierar si raporteaza totul.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")
      
         pc.setqf("refine_chance",1)
         say_title("Fierar:")
          ---                                                   l
         say_verde("")
         say_verde("Multumesc ca m-ai ajutat din nou. Esti un")
         say_verde("razboinic demn de incredere si am sa ii")
         say_verde("spun asta instructorului tau.")
         say_verde("")
         say_reward("Recompensa:")
         say_reward("10.000 Puncte de experienta")
         say_reward("30.000 Yang")
         say_reward("x5 Licoare de viteza de miscare (L)")
         say_reward("x5 Licoare de viteza de atac (L)")
         pc.give_item2(27105,5)
         pc.give_item2(27102,5)
         pc.give_exp2(10000)
         pc.change_money(30000)

         clear_letter()
         set_state( __COMPLETE__ )
         set_quest_state("levelup","run")
         set_quest_state("main_quest_lv10", "run")

      end
   end
   state __COMPLETE__ begin
   end

end