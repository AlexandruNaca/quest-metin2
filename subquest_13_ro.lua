---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_13 begin
        state start begin
                when login or levelup with pc.level >= 21 and pc.level <= 26 begin
                        set_state(information)
                end

        end
        state information begin
                when letter begin
                        local v = find_npc_by_vnum(9001)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Procura materialele")
                        end
                end


                when __TARGET__.target.click or
                        9001.chat."Procura materialele" with pc.level >= 21 begin
                        target.delete("__TARGET__")

                        say_title("Negustorul de arme:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Hei, tu. Poti sa imi faci o favoare?")
                        say_verde("")
                        say_verde("Am incercat sa fac creez un nou tip de")
                        say_verde("arma, dar materialele necesare sunt")
                        say_verde("greu de obtinut. Vrei sa ma ajuti?")

                        local s=select("Sigur, te ajut","Nu am timp")
                        if 2==s then
                                say_title("Negustorul de arme:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Negustorul de arme:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Negustorul de arme:")
                                say_verde("")
                                say_verde("Hai pleaca, nu am timp de oameni ca tine.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Negustorul de arme:")
                        say_verde("")
                        say_verde("Multumesc, du-te si fa rost de materiale!")
			set_state(get_weapon)
                end --when
        end  --state

        state get_weapon begin
                when letter begin
                        send_letter("~Lv 21 - Procura materiale")
                        q.set_icon("scroll_open_golden.tga")
                        if        pc.getqf("iron_done") == 0  then
                                local v=find_npc_by_vnum(20011)
                                if 0==v then
                                else
                                        target.vid("__TARGET1__",v,"Du-te la Uriel.")
                                end
                        end
                        if        pc.getqf("cloth_done") == 0  then
                                local v=find_npc_by_vnum(20021)
                                if 0==v then
                                else
                                        target.vid("__TARGET2__",v,"Du-te la Ariyoung.")
                                end
                        end

                        if        pc.getqf("cloth_done") == 1  then
                                local v=find_npc_by_vnum(20003)
                                if 0==v then
                                else
                                        target.vid("__TARGET3__",v,"Du-te la Ah-Yu.")
                                end
                        end

                end

                when info or button begin

                        say_title("Procura materiale")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Negustorul de arme are nevoie de materiale.")
                        say_verde("")
                        if pc.getqf("iron_done") < 2 then
                        	say_reward("Fier - Poti face rost de la Uriel.")
                        else
                        	say_verde("Fier - Ai deja.")
                        end
                        if pc.getqf("cloth_done") < 2 then
                        	say_reward("Ghem - Poti face rost de la Ariyoung.")
                        else
                        	say_verde("Ghem - Ai deja.")
                        end                        
                end
                when 20011.chat."Am nevoie de fier" with pc.getf("subquest_13","iron_done")==0 begin
                        target.delete("__TARGET1__")
                        say_title("Uriel:")
                        say_verde("")
                        say_verde("Ai nevoie de fier? Te ajut daca ma ajuti si")
                        say_verde("tu. Tigrii mi-au furat pachetul, te rog sa")
                        say_verde("il recuperezi, si am sa iti dau fier.")
                        say_item_vnum(30134)
                        pc.setqf("iron_done",1)

                end
                when 20011.chat."Am nevoie de fier" with pc.getf("subquest_13","iron_done") == 1 begin
                        target.delete("__TARGET1__")
                        if pc.count_item(30134) >= 1 then
                                say_title("Uriel:")
                                say_verde("")
                                say_verde("Multumesc pentru pachet, poftim fierul.")
                                pc.setqf("iron_done",2)
                                pc.remove_item(30134,1)
				if  pc.getqf("cloth_done") == 2 then
					set_state(back_to)
				end
                        else
                                say_title("Uriel:")
                                say_verde("")
                                say_verde("Ai nevoie de fier? Te ajut daca ma ajuti si")
                                say_verde("tu. Tigrii mi-au furat pachetul, te rog sa")
                                say_verde("il recuperezi, si am sa iti dau fier.")
                        end   --if
                end           --when

                when 114.kill  begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item(30134)==0 and pc.getqf("iron_done") == 1 then
				notice("Anunt: Ai gaist pachetul lui Uriel.")
				pc.give_item2(30134, 1)
                        end
                end


                when 20021.chat."Am nevoie de ghem" begin
                        target.delete("__TARGET2__")

                        if pc.getqf("cloth_done") == 0  then
                                say_title("Ariyoung:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Ai nevoie de ghem? Iti dau cu cea mai")
                                say_verde("mare placere, dar mai intai du aceasta")
                                say_verde("scrisoare lui Ah-Yu, nu ne-am vazut de")
                                say_verde("mult de cand e ocupata cu copilul ei.")
                                say("")
                                say_verde("Spune-i sa-ti dea ghem din partea mea.")
                                pc.setqf("cloth_done", 1)

                        end

                        if pc.getqf("cloth_done") == 2  then
                                say_verde("Ariyoung:")
                                say_verde("")
                                say_verde("Am vorbit cu ea, ti-a dat deja ghem.")
                        end

                end

                when  20003.chat."Scrisoarea lui Ariyoung" with pc.getf("subquest_13","cloth_done") == 1 begin
                        target.delete("__TARGET3__")
                        say_title("Ah-Yu:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Oh, multumesc pentru scrisoare. Imi e")
                        say_verde("dor de ea, poftim ghem-ul, o zi buna.")
			pc.setqf("cloth_done", 2)
			if pc.getqf("iron_done") == 2 then
				set_state(back_to)
			end
                end
	end
	state back_to begin
		when letter begin
                        send_letter("~Lv 21 - Am toate materiale")
                        q.set_icon("scroll_open_golden.tga")
			q.start()

			local v=find_npc_by_vnum(9001)
			if 0==v then
			else
				target.vid("__TARGET__",v,"Du-te la Negustorul de arme")
			end
		end
		when info or button begin
			say_title("Am toate matierlale")
			say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("Du-te la negustorul de arme.")
		end
		when __TARGET__.target.click or		
		9001.chat."Am toate materialele" with pc.getf("subquest_13","cloth_done") == 2 and pc.getf("subquest_13","iron_done") == 2  begin
			target.delete("__TARGET__")
			say_title("Negustorul de arme")
				say_verde("")
				----"123456789012345678901234567890123456789012345678901234567890"|
				say_verde("Ce bine! Acum pot sa produc arma!")
				say_verde("Multumesc pentru ajutorul tau.")
                                say_verde("")
                                say_reward("Recompensa:" )
                                say_reward("100.000 Puncte de experienta")
                                say_reward("70.000 Yang")
                                say_reward("x3 Cufar lumina lunii")
                                pc.give_exp2(100000)
                                pc.change_money(70000)
                                pc.give_item2(50011, 3)
				set_quest_state("levelup","run")
				clear_letter()
				set_state(__COMPLETE__)

				if pc.job == 0 then
					pc.give_item2("66", 1)
					say_reward("x1 Sabie de argint+6")
				elseif pc.job == 1 then
                                        pc.give_item2("66", 1)
                                        say_reward("x1 Sabie de argint+6")
				elseif pc.job == 2 then
					pc.give_item2("66", 1)
					say_reward("x1 Sabie de argint+6")
				elseif pc.job == 3 then
					pc.give_item2("7056", 1)
					say_reward("x1 Evantai acvatic+6")
				end   --if
				pc.setqf("cloth_done",0)
				pc.setqf("iron_done",0)
			end  --when
                end   --state

        state __COMPLETE__ begin
        end

        state __GIVEUP__ begin
        end
end