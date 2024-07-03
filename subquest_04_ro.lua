---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_4 begin
        state start begin
                when login or levelup with pc.level >= 9 and pc.level <= 14 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20016)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Cum mai e Deokbae")
                        end
                end
                when __TARGET__.target.click or
                        20016.chat."Cum mai e Deokbae" with pc.level >= 9 begin
                        target.delete("__TARGET__")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Am un prieten vechi, Deokbae si am o scrisoare")
                        say_verde("pentru el. Insa sunt foarte ocupat si nu am")
                        say_verde("timp sa ma duc panain satul vecin la el.")
                        wait()
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Poti sa ii duci tu scrisoarea din partea mea?")
                        say_verde("")

                        local s=select("Desigur","Nu am chef")
                        if 2==s then
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Vrei sa abandonezi misiunea?")
                        say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        return
                                end
                                say_title("Fierar:")
                		say_verde("")
                                say_verde("Nu-i nici o problema, la revedere.")
                                clear_letter()
                                set_state(__GIVEUP__)
                                return
                        end

                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Multumesc, poftim scrisoarea, acum du-te.")
                        say_item_vnum(30131)
                        pc.give_item2(30131)
                        set_state(deliver_letter)

                end
        end

        state deliver_letter begin
                when info or button begin
                        say_title("O scrisoare de la fierar")
                        say_verde("")
                        say_verde("Dute la Deokbae si da-i scrisoarea care ai")
                        say_verde("primit-o de la Fierar, Deokbae e in satul")
                        say_verde("vecin. Apasa pe M ca sa vezi cum ajungi.")
                end

                when letter begin
                        send_letter("~Lv 9 - O scrisoare de la fierar")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20015)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Deokbae")
                        end
                end

                when __TARGET__.target.click or
                        20015.chat."O scrisoare de la fierar" begin
                        if pc.count_item(30131) >= 1 then
                                target.delete("__TARGET__")
				----"123456789012345678901234567890123456789012345678901234567890"|
                                say_title("Deokbae:")
                                say_verde("")
                                say_verde("Salut, eu ma ocup cu comercializarea de")
                                say_verde("tarnacoape si de zacamante de minereuri.")
                                say_verde("")
                                say_verde("Oh, o scrisoare, pentru mine? De la cine?")
                                wait()

                                say_title("Deokbae:")
                                say_verde("")
                                say_verde("Aaaa, tovarasul meu fierarul. Ce mai face?")
                                say_verde("Spune-i ca ii multumesc pentru scrisoare.")
                                pc.remove_item(30131)

                                set_state(return_to)

                        else
                                say_title("Deokbae:")
                                say_verde("")
                                say_verde("Nu ai scrisoarea la tine? Vrei sa te")
                                say_verde("intorci la fierar sa ti-o dea iar?")
                                local s=select("Da, ma intorc","Nu mai vreau")
                                if 2==s then
                                        say_title("Deokbae:")
                                        say_verde("")
                                        say_verde("Vrei sa abandonezi misiunea?")
                                        local a=select("Da, vreau","Inchide")
                                        if 2==a then
                                                return
                                        end
                                        say_title("Deokbae:")
                                        say_verde("")
                                        say_verde("Cum ai putut sa pierzi scrisoarea?")
                                        say_verde("Dispari din fata ochilor mei.")
                                        clear_letter()
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Deokbae:")
                                say_verde("")
                                say_verde("Nu e nici o problema, intoarce-te la")
                                say_verde("fierar si spune-i sa iti dea scrisoarea.")
                                set_state(information)

                        end
                end
        end

        state return_to begin
                when info or button begin
                        say_title("Inapoi la fierar")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Ai rezolvat cu Deokbae, du-te la fierar.")
                end

                when letter begin
                        send_letter("~Lv 9 - Inapoi la fierar")
                        q.set_icon("scroll_open_golden.tga")
                        local v=find_npc_by_vnum(20016)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Inapoi la Fierar")
                        end
                end

                when 20016.chat."Am dus scrisoarea" begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Ai rezolvat? Ce mai face prietenul meu?")
                        say_verde("Imi e dor de el, am sa ii fac o vizita.")
			wait()
                        say_title("Fierar:")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("8.000 Puncte de experienta")
                        say_reward("10.000 Yang")
                        say_reward("x1 Cufar lumina luni")
                        pc.give_exp2(8000)
                        pc.change_money(10000)
                        pc.give_item2(50011)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end

        state __GIVEUP__ begin

        end

        state __COMPLETE__ begin
        end
end