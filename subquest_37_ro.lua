---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_37 begin
        state start begin
                when login or levelup with pc.level >= 51 and pc.level <= 53 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20005)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Secretul portelanului")
                        end
                end


                when __TARGET__.target.click or
                        20005.chat."Secretul portelanului" with pc.level >= 51 begin
                        target.delete("__TARGET__")

                        say_title("Yonah :")
                        say_verde("")
                        say_verde("Am nevoie de secretul portelanului Celadon.")
                        say_verde("Uriel ar putea sti ceva despre acesta, mergi")
                        say_verde("pana la Uriel sa il intrebi pentru mine?")
                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Yonah:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Yonah:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Yonah:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yonah:")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Uriel.")
                        set_state(ask_to_uriel)


                end
        end

        state ask_to_uriel begin
                when letter begin
                        send_letter("~Lv 51 - Secretul portelanului")
                        q.set_icon("scroll_open_golden.tga")
                end

                when letter begin
                        local v=find_npc_by_vnum(20011)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Du-te laUriel")
                        end

                end

                when info or button begin
                        say_title("Du-te la Uriel")
                        say_verde("")
                        say_verde("Yonah te-a trimis sa vorbesti cu Uriel.")
                end

                when __TARGET__.target.click or
                        20011.chat."Secretul portelanului" begin
                        target.delete("__TARGET__")
                        say_title("Uriel :")
                        say_verde("")
                        say_verde("Secretul portelanului Celadon? Nu am")
                        say_verde("auzit despre acest portelan... Poate")
                        say_verde("Soon ar putea sti ceva despre asta.")
                        set_state(ask_to_mrsoon)
                end
        end

        state ask_to_mrsoon begin
                when letter begin
                        send_letter("~Lv 51 - Secretul portelanului")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20023)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Soon")
                        end

                end

                when info or button begin
                        say_title("Secretul portelanului")
                        say_verde("")
                        say_verde("Uriel nu stie nimic despre secretul")
                        say_verde("portelanului, insa te-a trimis la Soon.")
                end

                when __TARGET__.target.click or
                        20023.chat."Sercetul portelanului" begin
                        target.delete("__TARGET__")
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Bla bla... Da stiu despre portelanul")
                        say_verde("Celadon, dar am nevoie sa faci ceva")
                        say_verde("pentru mine mai intai.")
                        wait()
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Du-te la negustorul ambulant si obtine")
                        say_verde("de la el informatiile care trebuie sa")
                        say_verde("mi le dea de ceva vreme. Dupa o sa iti")
                        say_verde("dau ceea ce doresti.")
                        set_state(to_seller)
                end
        end

        state to_seller begin
                when letter begin
                        send_letter("~Lv 51 - Secretul portelanului")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20010)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Negustor")
                        end

                end

                when info or button begin
                        say_title("Secretul portelanului")
                        say_verde("")
                        say_verde("Soon iti va da secretul portelanului dupa")
                        say_verde("ce v-ei vorbi cu negustorul ambulant")
                        say_verde("despre informatiile care trebuie sa le")
                        say_verde("dea lui Soon, du-te la el.")
                end

                when __TARGET__.target.click or
                        20010.chat."Secretul portelanului" begin
                        target.delete("__TARGET__")
                        say_title("Negustorul ambulant:")
                        say_verde("")
                        say_verde("Hei, ai nevoie de ceva de la mine?")
                        say_verde("")
                        say_verde("Aaah, poftim informatiile, du-le la Soon.")
                        set_state(back_to_bookbug)
                end
        end

        state back_to_bookbug begin
                when letter begin
                        send_letter("~Lv 51 - Secretul portelanului")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20023)
                        if 0!= v then
                                target.vid("__TARGET__",v,"Inapoi la Soon")
                        end
                end

                when info or button begin
                        say_title("Secretul portelanului")
                        say_verde("")
                        say_verde("Ai obtinut informatiile, du-te la Soon.")
                end

                when __TARGET__.target.click or
                        20023.chat."Secretul portelanului" begin
                        target.delete("__TARGET__")
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Super, multumesc, poftim secretul")
                        say_verde("portelanului, le am pe o notita scrise.")
                        pc.give_item2(30160)
                        set_state(back_to)
                end
        end

        state back_to begin
                when letter begin
                        send_letter("~Lv 51 - Secretul portelanului")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20005)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Yonah")
                        end
                end

                when info or button begin
                        say_title("Secretul portelanului")
                        say_verde("")
                        say_verde("Ai obtinut secretul, du-te la Yonah.")
                end

                when __TARGET__.target.click or
                        20005.chat."Secretul portelanului" begin
                        target.delete("__TARGET__")
                        say_title("Yonah:")
                        say_verde("")
                        say_verde("Ooh! In sfarsit, secretul portelanului")
                        say_verde("Celadon, iti multumesc ca m-ai ajutat.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("13.000.000 Puncte de experienta")
                        say_reward("410.000 Yang")
                        say_reward("x5 Cufar lumina lunii")
                        say_reward("x10 Boabe zen")
                        pc.remove_item(30160,1)
                        pc.change_money(410000)
                        pc.give_exp2(13000000)
                        pc.give_item2(70102,10)
                        pc.give_item2(50011,5)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(__COMPLETE__)
                        return

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