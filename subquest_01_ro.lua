---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_1 begin
        state start begin
                when login or levelup with pc.level >= 6 and pc.level <= 11 begin
                        set_state(information)
                end
        end

        state information begin
                when login or enter begin
                        local v=find_npc_by_vnum(9003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Fa rost de Sticla Goala")
                        end
                end

                when __TARGET__.target.click or 9003.chat."Ma ajuti te rog?" begin
                        target.delete("__TARGET__")

                        say_title("Magazinul general:")
                        say_verde("")
                        say_verde("Scuza-ma, daca ai timp ma poti ajuta si")
                        say_verde("pe mine cu ceva? Am nevoie de o sticla")
                        say_verde("goala pentru potiuniile mele.")
                        say_verde("")
                        say_item_vnum(30130)
                        local s=select("Te ajut","Nu am timp")
                        if 2==s then
                                say_title("Magazinul general:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea ?")

                                local a=select("Da, vreau","Inchide")
                                if 2==a then
                                        return
                                end

                                say_title("Magazinul general:")
                                say_verde("")
                                say_verde("Pacat, o zi frumoasa in continuare.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Magazinul general:")
                        say_verde("")
                        say_verde("Poti obtine o sticla goala de la Yonah.")
                        set_state(to_yeonnahwan)
                end
        end

        state to_yeonnahwan begin
                when letter begin
                        local v = find_npc_by_vnum(20005)
                        if v!= 0 then
                                target.vid("__TARGETS__", v, "Cauta-l pe Yonah")
                        end
                        send_letter("~Lv 6 - Cauta-l pe Yonah")
                        q.set_icon("scroll_open_golden.tga")

                end

                when button or info begin
                        say_title("Cauta-l pe Yonah")
                        say_verde("")
                        say_verde("Negustoarea de diverse are nevoie de o")
                        say_verde("sticla goala, dute si vorbeste cu Yonah.")
                        say_verde("")
                        say_item_vnum(30130)
                end

                when __TARGETS__.target.click begin
                        target.delete("__TARGETS__")
                        say_title("Yonah:")
                        say_verde("")
                        say_verde("Ai nevoie de sticla goala de la mine?")
                        say_verde("")
                        say_item_vnum(30130)
                        wait()
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Yonah:")
                        say_verde("")
                        say_verde("Fami rost de un sambure de piersic si")
                        say_verde("iti voi da sticla goala, acest sambure")
                        say_verde("de piersic se gaseste la Mistreti flamanzi.")
                        say_verde("")
                        say_item_vnum(30020)
                        wait()
                        set_state(hunt_for_peach)
                end
        end

        state hunt_for_peach begin
                when letter begin
                        send_letter("~Lv 6 - Samburele de piersic")
                        q.set_icon("scroll_open_golden.tga")
                end

                when button or info begin
                        say_title("Samburele de piersic")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Yonah are nevoie de sambure de piersic")
                        say_verde("in schimbul unei sticle goale.")
                        say_item_vnum(30020)
                        say_verde("")
                        say_verde("Omora mistreti flamand.")
                end

        	when 20005.chat."De unde fac rost de sambure?" with pc.count_item(30020) == 0 begin
                        say_title("Yonah:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Samburele de piersic pica la mistreti.")

                end

                when 178.kill begin
                        local s = number(1, 20)
                        if s == 1 then
                                pc.give_item2(30020, 1)
                                set_state(go_back_to_yonah)
                        end
                end
        end
    state go_back_to_yonah begin
                when letter begin
                        send_letter("~Lv 6 - Inapoi la Yonah")
                        q.set_icon("scroll_open_golden.tga")
                        local v = find_npc_by_vnum(20005)

                        if v!= 0 then
                                target.vid("__TARGET__", v, "Inapoi la Yonah")
                        end
                end
                when button or info begin
                        say_title("Inapoi la Yonah")
                        say_verde("")
                        say_verde("Ai obtinut samburele, du-te la Yonah.")
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        if pc.count_item(30020) >= 1 then

				say_title("Yonah:")
				say_verde("")
				say_verde("Oh, ai facut rost de sambure de piersic?")
				say_verde("Multumesc, poftim sticla goala.")
				say_item_vnum(30130)
				pc.remove_item(30020, 1)
				pc.give_item2(30130, 1)

				set_state(going_to_reward)
                        end
                end
    end

        state going_to_reward begin
                when letter begin
                        send_letter("~Lv 6 - Inapoi la Negustoare")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(9003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Inapoi la Negustoare")
                        end

                end
                when info or button begin
                        say_title("Inapoi la Negustoare")
                        say_verde("")
                        say_verde("Ai obtinut sticla goala, du-te la negustoare.")
                        say_item_vnum(30130)
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        if pc.count_item(30130) > 0 then
                                say_title("Magazinul general: ")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Multumesc frumos pentru ajutorul tau.")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("2.000 Puncte de experienta" )
                                say_reward("3.000 Yang")
                                say_reward("x1 Cufar lumina lunii")
                                pc.remove_item(30130)
                                pc.give_exp2(2000)
                                pc.change_money(3000)
                                pc.give_item2(50011)
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(__COMPLETE__)
                        else
                                say_title("Magazinul general: ")
                                say_verde("")
                                say_verde("Ce ai facut, ai pierdut sticla goala?")
                                say_verde("")
                                say_item_vnum(30130)
                                wait()
                                say_title("Magazinul general:")
                                say_verde("")
                                say_verde("Vrei sa mai incerci sa omori mistreti?")
                                local s=select("Mai incerc","Renunt")
                                if s==2 then
                                        say_title("Magazinul general:")
                                        say_verde("")
                                        say_verde("Vrei sa abandonezi misiunea?")
                                        say_verde("")
                                	local a=select("Da, vreau","Inchide")
                                	if 2==a then
                                        	return
                                        end
                                	say_pc_name()
                                	say_verde("")
                                	say_verde("Pacat, o zi frumoasa in continuare.")
                                	clear_letter()
                                	set_state(__GIVEUP__)
                                	return
                                end
                        	set_state(hunt_for_peach)
                        end
                end
        end

        state __GIVEUP__ begin
        end
        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end