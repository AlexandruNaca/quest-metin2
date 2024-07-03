---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv16 begin
        state start begin
        end
        state run begin
                when login or levelup or enter with pc.get_level() >= 16 begin
                        set_state( gotoboss )
                end
        end
        state gotoboss begin
                when letter begin
                        send_letter( "+Lv 16 - Captureaza spionul" )
                        q.set_icon("scroll_open_purple.tga")

                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Capitan")
                        end

                end
                when button or info begin
                        say_title("Du-te la capitan")
                        say_verde("")
                        say_verde("Capitanul te cauta, du-te si vorbeste cu el.")
                end
                when __TARGET__.target.click or 20355.chat."Captureaza spionul" begin
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Am o presimtire ca avem un spion la noi in")
                        say_verde("sat in juramantul alb, dute si afla ceva.")
                        target.delete("__TARGET__")
                        set_state( killrobber )
                end
        end

        state killrobber begin
                when letter begin
                        send_letter("+Lv 16 - Captureaza spionul")
                        q.set_icon("scroll_open_purple.tga")
                end
                when button or info begin
                        say_title("Captureaza spionul")
                        say("")
                        say_verde("Capitanul are o presimtire ca un spion da")
                        say_verde("tarcoale satului, omoara juramantul alb si")
                        say_verde("vezi daca poti sa afli ceva informatii.")
                end
                when 394.kill or 393.kill or 392.kill or 391.kill or 301.kill or 302.kill or 303.kill or 304.kill begin

                        if number( 1, 10 ) == 1 then
                                pc.give_item2( 30001, 1 )
                                say_title("Captureaza spionul")
                                say_verde("")
                                say_verde("Ai gasit ceva ciudat, raporteaza capitanului.")
                                set_state(gotoboss2)
                        end

                end
        end
        state gotoboss2 begin
                when letter begin
                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Capitan.")
                        end
                end
                when button or info begin
                        say_title("Captureaza spionul")
                        say_verde("")
                        say_verde("Ai gasit ceva ciudat, raporteaza capitanului.")
                end
                when __TARGET__.target.click begin
                        if pc.count_item(30001) >= 1 then
				say_title("Capitan:")
				say_verde("")
				say_verde("Ai gasit ceva ? Stiam eu ca cineva incearcas a")
				say_verde("ne spioneze, aceasta este o dovada clara.")
				wait()
				say_title("Capitan:")
				say_verde("")
				say_verde("Multumesc pentru ajutorul tau, ai fost de folos.")
                                say_verde("")
                                say_reward("Recompensa:")
				say_reward("100.000 Puncte de experienta" )
                                say_reward("50.000 Yang")
                                say_reward("x1 Cufar mistic")

                                pc.remove_item(30001)
                                pc.give_exp2(100000)
                                pc.change_money(50000)
                                pc.give_item2(50217,1)
				target.delete("__TARGET__")
                                clear_letter()
                                set_state(__COMPLETE__)
                                set_quest_state("main_quest_lv27", "run")
                                set_quest_state("levelup","run")
                        else
                        	say_title(pc.name..":")
                        	say_verde("")
                        	say_verde("Ti-am spus ce trebuie sa faci, dute si")
                        	say_verde("omoara juramantul alb pentru informatii.")
                        end
                end
        end
        state __COMPLETE__ begin
        end
end