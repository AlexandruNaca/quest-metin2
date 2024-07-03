---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_38 begin
        state start begin
                when login or levelup with pc.level >= 45 and pc.level <= 47 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20019)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Arcul impodobit")
                        end
                end


                when __TARGET__.target.click or
                        20019.chat."Arcul impodobit" with pc.level >= 45 begin
                        target.delete("__TARGET__")

                        say_title("Yang-Shin:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Maimutele din desert mi-au furat")
                        say_verde("arcul de vanatoare, imi faci inapoi")
                        say_verde("rost de el? O sa te recompensez.")
                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Yang-Shin:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Yang-Shin:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Yang-Shin:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yang-Shin:")
                        say_verde("")
                        say_verde("Du-te si omoara maimutele rele!")
                        set_state(hunt_monkey)

                end
        end

        state hunt_monkey begin
                when letter begin
                        send_letter("~Lv 45 - Arcul impodobit")
                        q.set_icon("scroll_open_golden.tga")
		end
                when info or button begin
                        say_title("Arcul impodobit")
                        say_verde("")
                        say_verde("Maimutele i-au furat arcul de vanatoare")
                        say_verde("a lui Yang-Shin.")
                end

                when 5121.kill or 5122.kill or 5123.kill or 5124.kill or 5125.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30136")== 0  then
                                pc.give_item2("30136", 1)
				send_letter("~Lv 45 - Ai gasit arcul")
                                q.set_icon("scroll_open_golden.tga")
				local v=find_npc_by_vnum(20019)
				if 0== v then
				else
					target.vid("__TARGET__",v,"Du-te la Yang-Shin")
				end

                        end
                end

                when 20019.chat."Am gasit arcul" begin
                        target.delete("__TARGET__")

                        if pc.count_item("30136") >= 1 then
                                say_title("Yang-Shin:")
                                say_verde("")
                                say_verde("L-ai gasit? Ce ma bucur, multumesc!")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("8.000.000 Puncte de experienta")
                                say_reward("35.000 Yang")
                                say_reward("x4 Cufar lumina lunii")
                                say_reward("x100 Mantia curajului")
                                pc.remove_item(30136, 1)
                                pc.give_exp2(8000000)
                                pc.change_money(350000)
                                pc.give_item2(70038,100)
                                pc.give_item2(50011,4)
                                set_quest_state("levelup","run")
                                set_state(COMPLETE)
                                clear_letter()
                                return
                        else
                                say_title("Yang-Shin:")
                                say_verde("")
                                say_verde("Nu ai arcul, il mai cauti?")
                                local s=select("Da, il caut","Nu am timp")
                                if 2==s then
                                say_title("Yang-Shin:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                        if  1==a then
                                                say_title("Yang-Shin:")
                                                say_verde("")
                                                say_verde("Atunci, succes in continuare.")
                                                set_state(__GIVEUP__)
                                                return
                                        end
                                say_title("Yang-Shin:")
                                say_verde("")
                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                end
                        end
                end
        end

        state __GIVEUP__ begin
        end

        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end
end