---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_18 begin
        state start begin
                when login or levelup with pc.level >= 10 and pc.level <=12  begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20002)
                        if 0!=v then
                        target.vid("__TARGET__", v, "Aranyo")
                        end
                end
                when __TARGET__.target.click or
                        20002.chat."Unde naiba e sotul meu?" begin
                        target.delete("__TARGET__")
                        say_title("Aranyo:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Sotul meu e cea mai mare povara din viata")
                        say_verde("mea. Crede ca sunt grasa si ii e rusine sa")
                        say_verde("stea langa mine in sat, sta cu cartile lui.")
                        say_verde("")
                        say_verde("Bata-i dumnezo cartile lui cu tot. Ma ajuti")
                        say_verde("sa il gasesc? Nu stiu unde naiba se ascunde.")

                        local s=select("Ma duc sa-l caut","Nu am timp")
                        if 2==s then
                                say_title("Aranyo:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Aranyo:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Aranyo:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Aranyo:")
                        say_verde("")
                        say_verde("Multumesc, du-te cauta-l pe nenorocit!")
                        set_state(find_mrsoon)

                end
        end
        state find_mrsoon begin
                when letter begin
                        send_letter("~Lv 10 - Cauta-l pe Soon")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20023)
                        if 0!=v then
                                target.vid("__TARGET2_", v, "Cauta-l pe Soon")
                        end

                end
                when button or info begin
                        say_title("Cauta-l pe Soon")
                        say_verde("")
                        say_verde("Cauta-l pe Soon, Aranyo il cauta.")
                end
                when 20002.chat."Unde naiba e sotul meu?"  begin
                        say_title("Aranyo:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Sotul meu e cea mai mare povara din viata")
                        say_verde("mea. Crede ca sunt grasa si ii e rusine sa")
                        say_verde("stea langa mine in sat, sta cu cartile lui.")
                        say_verde("")
                        say_verde("Bata-i dumnezo cartile lui cu tot. Du-te si")
                        say_verde("cauta-l, nu stiu unde naiba se ascude.")
                end
                when  __TARGET2__target.click or
                        20023.chat."Te-am gasit" begin
                        target.delete("__TARGET2_")
                        say_title("Soon:")
                        say_verde("")
                        say_verde("M-ai gasit? Pai de cand ma cautai? Eu tot")
                        say_verde("Aici sunt de cand m-am certat cu sotia mea.")
                        wait()
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Sotia mea te-a trimis sa ma cauti, nu?")
                        wait()
                        say_title(pc.get_name()..":")
                        say_verde("")
                        say_verde("La naiba, si-a dat seama. Ce sa fac?")
                        local s=select("Te inseli, nu te cautam","Da, acum te-am gasit")

                        if 1==s then
                                say_title("Soon:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Aha, okey atunci. Vrei sa citesti o carte?")
                                say_verde("Am cele mai bune carti din intreg satul.")
                                set_state(report_false)
                        elseif 2==s then
                                say_title("Soon:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Of, la naiba. Ea nu ma intelege deloc pe")
                                say_verde("mine. Cartile sunt remediul meu spiritual.")
                                say_verde("")
                                say_verde("As vrea sa ma inteleaga mai bine de atat...")
                                set_state(report_true)
                        end
                end
        end
        state report_false begin
                when letter begin
                        send_letter("~Lv 10 - Du-te la Aranyo")
                        q.set_icon("scroll_open_golden.tga")
                        local v=find_npc_by_vnum(20002)
                        if v!=0 then
                                target.npc("__TARGET__", v, "Du-te la Aranyo")
                        end
                end
                when button or info begin
                        say_title("Du-te la Aranyo")
                        say_verde("")
                        say_verde("Du-te la Aranyo si vorbeste cu ea.")
                end

                when __TARGET__.target.click or
                        20002.chat."Unde naiba e sotul meu?" begin
                        target.delete("__TARGET__")
                        say_title("Aranyo:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Nu l-ai gasit? Nu e nici o problema.")
                        say_verde("Pana la urma tot dau eu de el.")
                        set_state(come_back)
                end
        end
        state come_back begin
                when letter begin
                        send_letter("~Lv 10 - Du-te la Soon")
                        q.set_icon("scroll_open_golden.tga")
                        local v=find_npc_by_vnum(20023)
                        if v!=0 then
                                target.npc("__TARGET__", v, "Du-te la Soon")
                        end
                end
                when button or info begin
                        say_title("Du-te la Soon")
                        say_verde("")
                        say_verde("Du-te la Soon si vorbeste cu el.")
                        say_verde("")
                end
                when __TARGET__.target.click or
                        20023.chat."Am vorbit cu Aranyo" begin
                        target.delete("__TARGET__")
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Nu i-ai zis ca m-ai gasit? Esti istet!")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("50.000 Yang")
                        pc.change_money(50000)

                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end

        state report_true begin
                when letter begin
                        send_letter("~Lv 10 - Du-te la Aranyo")
                        q.set_icon("scroll_open_golden.tga")
                        local v=find_npc_by_vnum(20002)
                        if v!=0 then
                                target.npc("__TARGET__", v, "Du-te la Aranyo")
                        end
                end

                when button or info begin
                        say_title("Du-te la Aranyo")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Du-te la Aranyo si spune-i ca l-ai gasit.")
                end
                when 20023.chat."Te-am gasit" begin
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Bine ca m-ai gasit. Acum esti fericit?")
                end
                when __TARGET__.target.click or
                        20002.chat."Ti-am gasit sotul" begin
                        target.delete("__TARGET__")
                        say_title("Aranyo:")
                        say_verde("")
                        say_verde("L-ai gasit? In sfarsit, de cand ma tot")
                        say_verde("uit dupa el. Multumesc ca m-ai ajutat!")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("20.000 Puncte de experienta")
                        pc.give_exp2(20000)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
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