---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv6 begin
    state start begin
   end 
   state run begin
       when login or levelup or enter with pc.get_level() >= 6 begin
          set_state ( information )
      end
    end
    state information begin
        when letter begin
          send_letter ("+Lv 6 - Clopotelul lui Yonah")
          q.set_icon("scroll_open_purple.tga")
      end
        when button or info begin
         say_title ("Clopotelul lui Yonah")
         say_verde("")
         say_verde("Yonah are nevoie de ajutorul tau.")
         say_verde("El are nevoie de un Clopotel.")
         say_verde("")
         say_reward("Omoara Mistreti famanzi rosii.")
      end

      when 179.kill begin
          local s = number(1, 30)
         if s <= 5 and pc.count_item("30065") ==0 then
             pc.give_item2(30065, 1)
            set_state(gototeacher)
         end
      end
   end

   state gototeacher begin
      when letter begin
         local v=find_npc_by_vnum(20005)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Clopotelul lui Yonah")
         end
      end
      when letter begin
         send_letter("+Lv 6 - Clopotelul lui Yonah")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title ("Clopotelul lui Yonah")
         say_verde("")
         say_verde("Ai obtinut Clopotelul lui Yonah.")
         say_verde("Acum dute la Yonah si vorbeste cu el.")
      end
      when __TARGET__.target.click or
          20005.chat."Clopotelul lui Yonah" begin
          target.delete("__TARGET__")
          ---
          say_title("Yonah:")
          say_verde("")
          say_verde("Iti multumesc ca ai facut rost de clopotel")
          say_verde("pentru mine, am nevoie de el pentru ceva")
          say_verde("special. Sotia mea va sti ce sa faca cu el.")
          say_verde("")
          say_reward("Recompensa:")
          say_reward("3.000 Puncte de experienta")
          say_reward("10.000 Yang")
          say_reward("x10 Licoare de viteza de miscare (M)")
          say_reward("x10 Licoare de viteza de atac (M) ")
          pc.remove_item("30065", 1)
          pc.give_item2(27104,10)
          pc.give_item2(27101,10)
          pc.give_exp2(3000)
          pc.change_money(10000)

          set_quest_state("levelup","run")

          clear_letter()
          set_quest_state("main_quest_lv7", "run")
          set_state( __COMPLETE__ )
      end
   end
   state __COMPLETE__ begin
   end   
        end