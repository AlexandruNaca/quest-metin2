---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_24 begin
    state start begin
                when login or levelup with pc.level >=39 and pc.level <=41 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20012)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Placinta cu orez")
                        end
                end

                when __TARGET__.target.click or
                        20012.chat."Placinta cu orez"  begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Eu vand placinta cu orez, dar cumva am")
                        say_verde("pierdut una din placintele mele. Cred")
                        say_verde("ca asta sa intamplat cand am fost in")
                        say_verde("excursie in Desertul Yongbi, mergi")
                        say_verde("pana acolo sa imi gasesti placinta?")
                        local s=select("Sigur, ma duc","Nu, mi-e frica")
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
                        say_verde("Du-te si omoara pui de paianjeni pana")
                        say_verde("imi gasesti placinta, ai 30 de minute.")
                        set_state(accept)
            end
      end
    state accept begin
                when letter begin
                        send_letter("~Lv 39 - Placinta cu orez")
                        q.set_icon("scroll_open_golden.tga")
                end

                when button or info begin
                        say_title("Placinta cu orez")
                        say_verde("")
                        say_verde("Du-te in Desertul Yongbi si omoara pui")
                        say_verde("de paianjen pana gasesti placinta cu")
                        say_verde("orez pierduta a lui Yu-Rang.")
                end

                when 20012.chat."Placinta cu orez" begin
                        if get_time() < pc.getqf("limit_time") then
                                say_title("Yu-Rang:")
                                say_verde("")
                                say_verde("Ce? Nu ai gasit inca placinta cu orez?")
                                say_verde("Oh nu, nu mergi sa mai incerci te rog?")
                        local s=select("Sigur, ma duc","Nu, mi-e frica")
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
                        say_verde("Du-te si omoara pui de paianjeni pana")
                        say_verde("imi gasesti placinta, ai 30 de minute.")
                                return
                        end
                        say_title("Yu-Rang:")
                        say_verde("")
                        say_verde("Timpul s-a scurs, imi pare rau.")
                        set_state(__FAIL__)
                end

                when enter begin
                    pc.setqf("limit_time", get_time()+30*60)
                    pc.setqf("kill_count", 0)
                end

                when leave begin
                    pc.setqf("limit_time", 0)
                    pc.setqf("kill_count", 0)
                    q.done()
                end
                when letter begin
                    local rest_time=pc.getqf("limit_time")-get_time()
                         timer("time_over", rest_time)
                         q.set_clock("Timp ramas:", rest_time)
                end
                when time_over.timer begin
                    say_title("Placinta cu orez")
                    say_verde("")
                    say_verde("Timpul sa scurs, ai esuat razboinicule.")
                    set_state(__FAIL__)
                    q.done()
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                        when 2001.kill begin
                    local cur_kill_count=pc.getqf("kill_count")+1
                    pc.setqf("kill_count", cur_kill_count)

                    if cur_kill_count>=number(30, 40) then
                                pc.give_item2(30158)
                                set_state(report)
                    end
                end



        end
        state report begin
                when letter begin
                        send_letter("~Lv 39 - Ai gasit placinta")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20012)
                        if v!=0 then
                                target.vid("__TARGET__", v, "Du-te la Yu-Rang")
                        end

                end
                when button or info begin
                        say_title("Ai gasit placinta")
                        say_verde("")
                        say_verde("Intr-un final ai gasit placinta cu orez.")
                        say_verde("Du-te cu ea la Yu-Rang, grabeste-te!")
                end

                when __TARGET__.target.click or
                        20012.chat."Placinta cu orez" with pc.count_item(30158) >0  begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say_verde("")
                        say_verde("Multumesc, te-ai descurcat excelent.")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("4.000.000 Puncte de experienta")
                        say_reward("190.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        pc.give_exp2(4000000)
                        pc.change_money(190000)
                        pc.give_item2(50011, 4)
                        pc.remove_item(30158)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end
        state __FAIL__ begin
        end
    state __GIVEUP__ begin
    end
    state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
    end
end