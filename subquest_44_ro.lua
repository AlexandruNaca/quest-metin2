---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_44 begin
        state start begin
                when login or  levelup with pc.level >= 37 and pc.level <= 39 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20012)
                        if v!= 0 then
                                target.vid("__TARGET__", v, "Du-te la Yu-Rang")
                        end
                end


                when __TARGET__.target.click or
                        20012.chat."Paianjenul cu clopotel" with pc.level >= 37 begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Am facut un pariu cu Taurean, a spus ca ea")
                        say_verde("poate agata un clopotel pe un pui de")
                        say_verde("paianjen dar e prea periculos pentru mine")
                        say_verde("sa ma duc sa verific, sunt curioasa daca")
                        say_verde("chiar a reusit asa ceva, mergi tu sa vezi?")
                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Yu-Rang:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Yu-Rang:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Yu-Rang:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yu-Rang:")
                        say_verde("")
                        say_verde("Du-te si omoara Puii de paianjen.")
                        set_state(go_to_desert)
                        pc.setqf("kill_count", 0)
                end
    end

    state go_to_desert begin
                when letter begin
                        send_letter("~Lv 37 - Paianjenul cu clopotel")
                        q.set_icon("scroll_open_golden.tga")
                end
                when button or info begin
                        say_title("Paianjenul cu clopotel")
                        say_verde("")
                        say_verde("Yu-Rang vrea sa vada daca Taurean chiar")
                        say_verde("a agatat un clopotel pe un pui de paianjen.")
                        say_verde("")
                        say_verde("Omoara cativa si vezi daca are dreptate.")
                end

                when 20012.click begin
                        say_title("Yu-Rang")
                        say_verde("")
                        say_verde("Oare chiar sa fi agatat clopotelul?")
                end



                when 2001.kill or 2002.kill or 2003.kill or 2004.kill or  2005.kill with pc.getf("subquest_44","spider_eye")==0  begin
                        local cur_kill_count=pc.getqf("kill_count")+1
                        pc.setqf("kill_count", cur_kill_count)

                        if cur_kill_count>=number(10, 50) then
                                set_state(fail_find_bell)
                        end
                end
        end
        state fail_find_bell begin
                when letter begin
                        send_letter("~Lv 37 - Nu ai gasit nimic")
                        q.set_icon("scroll_open_golden.tga")
                end

                when info or  button begin
                        say_title("Nu ai gasit nimic")
                        say_verde("")
                        say_verde("Nu ai gasit nici un clopotel agatat")
                        say_verde("de puii de paianjen, poate ar fi mai")
                        say_verde("bine sa mergi la Taurean sa o intrebi.")
                        set_state(go_to_boy)
                end
        end

    state go_to_boy begin
                when letter begin
                        send_letter("~Lv 37 - Du-te la Taurean")
                        q.set_icon("scroll_open_golden.tga")

                  local v = find_npc_by_vnum(20014)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Du-te la Taurean")
                        end

                end
                when button or info begin
                        say_title("Du-te la Taurean")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Taurean.")
                end

                when __TARGET__.target.click or
                        20014.chat."Paianjenul cu clopotel" begin
                        target.delete("__TARGET__")
                        say_title("Taurean:")
                        say_verde("")
                        say_verde("Am facut pariul cu Yu-Rang, dar am mintit.")
                        say_verde("")
                        say_verde("Vreau asa de mult sa castig pariul... Ma")
                        say_verde("ajuti tu sa agat clopotelul de paianjen?")
                        local s=select("Sigur, te ajut", "Te spun la Yu-Rang")
                        if 2==s then
                                say_title("Taurean:")
                                say_verde("")
                                say_verde("Ce? Vrei sa ma dai in gat?")
                                local a=select("Da, vreau","M-am razgandit")
                                if  2==a then
                                        say_title("Taurean:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Taurean:")
                                say_verde("")
                                say_verde("Okey, spune-ma.. fa ce vrei!")
                                set_state(report_YuRang)
                                return
                        end
                        say_title("Taurean:")
                        say_verde("")
                        say_verde("Du-te si agata-l de puii de painjen.")
                        set_state(attach_bell)
                end
    end

    state report_YuRang begin

                when letter begin
                        send_letter("~Lv 37 - Inapoi la Yu-Rang")
                        q.set_icon("scroll_open_golden.tga")

                   local v=find_npc_by_vnum(20012)
                        if v!=0 then
                                target.vid("__TARGET__", v, "Inapoi la Yu-Rang")
                        end

                end
                when button or info begin
                        say_title("Inapoi la Yu-Rang")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Yu-Rang.")
                end

                when 20014.chat."Pianjenul cu clopotel" begin
                        say_title("Taurean:")
                        say_verde("")
                        say_verde("Vreau asa de mult sa castig acel pariu...")
                end
                when __TARGET__.target.click or
                        20012.chat."Paianjenul cu clopotel" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say_verde("")
                        say_verde("Ce? Taurean mintea? Stiam eu, multumesc!")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("3.000.000 Puncte de experienta")
                        say_reward("270.000 Yang")
                        pc.change_money(270000)
                        pc.give_exp2(3000000)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end

    state attach_bell begin
                when letter begin
                        send_letter("~Lv 37 - Paianjenul cu clopotel")
                        q.set_icon("scroll_open_golden.tga")
                end

                when button or info begin
                        say_title("Paianjenul cu clopotel")
                        say_verde("")
                        say_verde("Du-te in desert si agata clopotelul de")
                        say_verde("un pui de painjen pentru Taurean.")
                end
                when 20014.chat."Paianjenul cu clopotel" begin
                        say_title("Taurean:")
                        say_verde("")
                        say_verde("L-ai agatat? Vreau sa castig pariul!")
                end

                when 2001.kill or 2002.kill or 2003.kill or 2004.kill or  2005.kill  begin
                        local cur_kill_count=pc.getqf("kill_count")+1
                        pc.setqf("kill_count", cur_kill_count)

                        if cur_kill_count>=number(10, 50) then
                            send_letter("~Lv 37 - Ai agatat clopotelul")
                            q.set_icon("scroll_open_golden.tga")
                                set_state(report_girl_lie)
                        end
                end

        end
    state report_girl_lie begin
                when letter begin
                        send_letter("~Lv 37 - Du-te la Yu-Rang")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20012)
                        if v!=0 then
                                target.vid("__TARGET__", v, "Du-te la Yu-Rang")
                        end

                end

                when button or info begin
                        say_title("Du-te la Yu-Rang")
                        say_verde("")
                        say_verde("Ai agatat clopotelul, du-te la Yu-Rang.")
                end

                when 20014.chat."Paianjenul cu clopotel" begin
                        say_title("Taurean:")
                        say_verde("")
                        say_verde("L-ai agatat? Multumesc mult! Acum")
                        say_verde("du-te si spune-i la Yu-Rang.")
                end
                when __TARGET__.target.click or
                        20012.chat."Paianjenul cu clopotel" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say_verde("")
                        say_verde("Ce? Taurean chiar a agatat clopotelul?")
                        say_verde("Uau... inseamna ca nu a mintut...")
                        set_state(report_boy_lie)
                end
        end
    state report_boy_lie begin
                when letter begin
                        send_letter("~Lv 37 - Du-te la Taurean")
                        q.set_icon("scroll_open_golden.tga")
                        local v=find_npc_by_vnum(20014)
                        if v!=0 then
                                target.vid("__TARGET__", v, "Du-te la Taurean")
                        end
                end

                when button or info begin
                        say_title("Du-te la taurean")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Taurean")
                end

                when __TARGET__.target.click or
                        20014.chat."Paianjenul cu clopotel" begin
                        target.delete("__TARGET__")
                        say_title("Taurean:")
                        say_verde("")
                        say_verde("Am castigat pariul. Multumesc ca m-ai")
                        say_verde("ajutat, sa nu spui la nimeni ca am")
                        say_verde("mintit-o pe Taurean. Este un secret.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("3.000.000 Puncte de experienta")
                        say_reward("270.000 Yang")
                        say_reward("x1 Inelul experientei")
                        say_reward("x1 Marmura binecuvantata")
                        pc.change_money(270000)
                        pc.give_exp2(3000000)
                        pc.give_item2(70005)
                        pc.give_item2(70024)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
                end
    end
    state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
    state __GIVEUP__ begin
    end
end