---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest animal_de_companie begin
        state start begin
		
		when login or levelup or enter with pc.get_level() >= 5 begin		
		     local v = find_npc_by_vnum(20355)
             if v != 0 then
            target.vid("__TARGET__", v, "Capitan")
         end
			send_letter("~Lv 5 - Cadou de la Capitan")
			q.set_icon("scroll_open_golden.tga")
		end
		
		when button or info begin		
			say_title ("Cadou de la Capitan")
			say_verde("")
			say_verde( "Du-te la Capitan, iti va da un cadou.")
		end
		
		when __TARGET__.target.click or
        20355.chat."Cadou de la Capitan" begin
        target.delete("__TARGET__")
		
		say_title( "Capitan:" )
		say_verde("")
		say_verde("Iti voi da un mic cadou care te va ajuta.")
		say_verde("")
		say_reward("Recompensa:")
		say_reward("x10 Vin fiert")
		say_reward("x1 Cufar lumina lunii")
		
		local s = select ( "Multumesc" )

             if s == 1 then
		
		pc . give_item2 ( 50216 , 10 ) 
		pc . give_item2 ( 50011 , 1 )
		
		set_state ( "__COMPLETE__" ) 
		clear_letter()

		end
	end
end
        state __COMPLETE__ begin	
        end
end  