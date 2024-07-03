---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_5 begin
        state start begin
                when login or levelup with pc.level >= 10 and pc.level <= 15 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20023)
                        if v != 0 then
                                target.vid("__TARGETF__", v, "O favoare pentru Soon")
                        end
                end

                when __TARGETF__.target.click or
                        20023.chat."O favoare pentru Soon" with pc.level >= 10 begin
                        target.delete("__TARGETF__")
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Bla, bla... Ce naiba...Cine esti tu?")
                        say_verde("Nu ma deranja in timp ce citesc!")
                        say_verde("")
                        say_verde("Scuze, nu am vrut sa tip la tine.")
                        say_verde("Uneori cand citesc nu inteleg si")
                        say_verde("devin frustrat, ciudat nu-i asa?")
                        wait()
                         say_title("Soon:")
                         say_verde("")
                         say_verde("Studiez armele samanilor, evantaiele.")
                         say_verde("")
                         say_verde("Nu reusesc sa imi dau seama care sunt")
                         say_verde("cele mai bune evantaie in lupta, si nu")
                         say_verde("am cum sa le testez. In schimb Uriel ar")
                         say_verde("trebui sa stie, mergi sa il intrebi tu?")
                        local s=select("Ma duc","Nu am timp")
                        if 2==s then
                                 say_title("Soon:")
                                 say_verde("")
                                 say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                        if  2==a then
                                                return
                                        end
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Ce urat din partea ta... ")
                                say_verde("Acum dispari, vreau sa citesc.")
                                clear_letter()
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Serios? Multumesc frumos, te astept.")
                        set_state(ask_to)

                end
        end

        state ask_to begin
                when info or button begin
                        say_title("Ajutor pentru Soon")
                        say_verde("")
                        say_verde("Du-te la Uriel si intreaba-l care sunt")
                        say_verde("cele mai bune evantaie in lupta.")
                end

                when letter begin
                        local v = find_npc_by_vnum(20011)
                        if v != 0 then
                                target.vid("__TARGETF__", v, "Ajutor pentru Soon")
                        end
                        send_letter("~Lv 10 - Ajutor pentru Soon")
                        q.set_icon("scroll_open_golden.tga")
                end



                when __TARGETF__.target.click or
                        20011.chat."Ajutor pentru Soon" begin
                        target.delete("__TARGETF__")

                        say_title("Uriel:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Soon vrea sa stie care sunt cele mai")
                        say_verde("bune evantaie in lupta? Foarte bine.")
                        say_verde("")
                        say_verde("Cele mai bune in lupta sunt evantaiele:")
                        say_reward("Evantai triplu si Evantai pana cocorului.")

                        set_state(return_to)
                end
        end

        state return_to begin
                when letter begin
                        send_letter("~Lv 10 - Inapoi la Soon")
                        q.set_icon("scroll_open_golden.tga")
                        local v = find_npc_by_vnum(20023)
                        if v != 0 then
                                target.vid("__TARGETF__", v, "Inapoi la Soon")
                        end
                end


                when info or button begin
                        say_title("Inapoi la Soon")
                        say_verde("")
                        say_verde("Intoarce-te la Soon si spune-i ce ti-a")
                        say_verde("zis Uriel referitor la evantaie.")
                end

                when __TARGETF__.target.click or 20023.chat."Am aflat care sunt" begin
                        target.delete("__TARGETF__")
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Deci? Care sunt cele mai bune?")

                        local s = select(
                        "Evantai acvatic si Evantai triplu",
                        "Evantai triplu si Evantai pana cocorului",
                        "Evantai pana cocorului si Evantai acvatic",
                        "Am uitat")

                        if s == 2 then
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Multumesc frumos pentru informatie.")
                                say_verde("")
                                say_reward("Recompensa:" )
                                say_reward("10.000 Puncte de experienta")
                                say_reward("10.000 Yang")
                                say_reward("x1 Cufar lumina lunii")
                                pc.give_exp2(10000)
                                pc.change_money(10000)
                                pc.give_item2(50011)
                                set_quest_state("levelup","run")
                                clear_letter()

                                set_state(__COMPLETE__)

                        elseif s==4 then
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Nu sunt sigur ca acestea sunt cele")
                        say_verde("mai bune evantaie, intoarce-te si")
                        say_verde("mai intreaba o data sa fi sigur.")
                        local s=select("Ok, plec acum","Nu mai am chef")
                        if 2==s then
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Vrei sa abandonezi misiunea?")
                        local a=select("Da, vreau","Inchide")
                        if  2==a then
                        return
                        end
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Deja ma enervezi, mai bine pleaca!")
                        set_state(__GIVEUP__)
        end
            say_title("Soon:")
            say_verde("")
            say_verde("Du-te si intreaba-l din nou, te astept.")
            set_state(ask_to)

                        else
                            say_title("Soon:")
                            say_verde("")
                            say_verde("Nu sunt sigur ca acestea sunt cele")
                            say_verde("mai bune evantaie, intoarce-te si")
                            say_verde("mai intreaba o data sa fi sigur.")
                                local s=select("Ok, plec acum","Nu mai am chef")
                                if 2==s then
                                    say_title("Soon:")
                                    say_verde("")
                                    say_verde("Vrei sa abandonezi misiunea?")
                                        local a=select("Da, vreau","Inchide")
                                                if  2==a then
                                                        return
                                                end
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Deja ma enervezi, mai bine pleaca!")
                                        set_state(__GIVEUP__)
                                end
                                    say_title("Soon:")
                                    say_verde("")
                                    say_verde("Du-te si intreaba-l din nou, te astept.")
                                    set_state(ask_to)
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