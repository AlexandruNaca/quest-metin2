---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_49 begin
        state start begin
                when login or levelup or enter with pc.level >= 59 and pc.level <= 61 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20014)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Taurean")
                        end
                end


                when __TARGET__.target.click or
                        20014.chat."Bingsu?" with pc.level >= 59 begin
                        target.delete("__TARGET__")
                        say_title("Taurean:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Am vorbit cu Yu-Rang si mi-a spus ca a")
                        say_verde("mancat ce-a mai delicios desert si anume")
                        say_verde("Bingsu, dar acest desert este un fel de")
                        say_verde("inghetata care se face doar iarna. Ma")
                        say_verde("ajuti sa vedem daca putem face unul?")
                        local s=select("Sigur, te ajut","Nu am timp")
                        if 2==s then
                                say_title("Taurean:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Taurean:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Taurean:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Taurean:")
                        say_verde("")
                        say_verde("Intreb-o pe Harang despre detalii.")
                        set_state(ask_to_harang)



                end
        end

        state ask_to_harang begin
                when info or button begin
                        say_title("Bingsu?")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Intreab-o pe Harang cum se face acest")
                        say_verde("Bingsu pentru Taurean.")
                end

                when letter begin
                        send_letter("~Lv 59 - Bingsu?")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum("20024")
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Du-te la Harang")
                        end
                end

                when __TARGET__.target.click or
                        20024.chat."Cum se face Bingsu?" begin
                        target.delete("__TARGET__")
                        say_title("Harang:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Pai, eu am mancat Bingsu de la bucatarul")
                        say_verde("Octavio, de unde sa stiu eu cum se face.")
                        say_verde("Du-te si vorbesti cu Ocvatio, el stie.")
                        set_state(ask_to_chef)
                end
        end

        state ask_to_chef begin
                when letter begin
                        send_letter("~Lv 59 - Du-te la Octavio")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum("20008")
                        if 0== v then
                        else
                                target.vid("__TARGET1__",v,"Du-te la Octavio")
                        end
                end

                when info or button begin
                        say_title("Du-te la Octavio")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Du-te la Octavio si vorbeste cu el")
                        say_verde("despre producerea desertului Bingsu.")
                end



                when __TARGET1__.target.click or
                        20008.chat."Cum se face Bingsu?" begin
                        target.delete("__TARGET1__")
                        say_title("Octavio:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Bingsu? Iti fac o portie cu mare drag")
                        say_verde("dar am nevoie de 50 de bulgare de gheata")
                        say_verde("de la monstrii de gheata de pe munte.")
                        say_verde("Adu-mi acesti bulgari si rezolv eu.")
                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Octavio:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Octavio:")
                        say_verde("")
                        say_verde("Du-te si omoara monstrii de gheata.")
                        set_state(gain_ice)
                end
        end

        state gain_ice begin
                when letter begin
                        send_letter("~Lv 59 - Bingsu?")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        if pc.count_item("30146")>=50 then
                                local v=find_npc_by_vnum(20008)
                                if 0==v then
                                        else
                                        target.vid("__TARGET__",v,"Du-te la Octavio")
                                end
                        end

                end

                when info or button begin

                        if pc.count_item("30146")>=50 then
                                say_title("Bingsu?")
                                say_verde("")
                                say_verde("Ai obtinut toti bulgarii de gheata.")
                                say_verde("Du-te cu ei la Octavio.")
                                return
                        end
                        say_title("Bingsu?")
                        say_verde("")
                        say_verde("Obtine 50 de bulgari de gheata omorand.")
                        say_verde("monstrii de gheata de pe muntele sohan.")
                end

                when 1101.kill begin
                        local s = number(1, 50)
                        if s <= 7 and pc.count_item("30146")< 50  then
                                pc.give_item2("30146", 2)
                        end
                end

                when __TARGET__.target.click or
                        20008.chat."Am toti bulgarii" begin
                        target.delete("__TARGET__")
                        if pc.count_item("30146") >= 50 then
                                say_title("Octavio:")
                                say_verde("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_verde("Bun, am terminat deja, poftim bingsu.")
                                say_item_vnum(30149)
                                pc.give_item2(30149)
                                set_state(back_to_boy)
                                pc.remove_item(30146, 50)
                                return
                        else
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Nu ai toti bulgarii, mai incerci?")
                                local s=select("Mai incerc","Nu am timp")
                                if 2==s then
                                        say_title("Octavio:")
                                        say_verde("")
                                        ----"12345678901234567890123456789012345678901234567890"|
                                        say_verde("Prea greu pentru tine? Asta este...")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Octavio:")
                                say_verde("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_verde("Oh, ce bine ca te-ai razgandit.")

                        end
        end
end

state back_to_boy begin
        when letter begin
                        send_letter("~Lv 59 - Du-te la Taurean")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v = find_npc_by_vnum(20014)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Du-te la Taurean")
                        end

                end

                when info or button begin
                        say_title("Du-te la Taurean")
                        say_verde("")
                        say_verde("Ai obtinut Bingsu, du-te la Taurean.")
                        say_item_vnum(30149)
                end


                when __TARGET__.target.click or
                        20014.chat."Ti-am adus Bingsu!" begin
                        target.delete("__TARGET__")
                        if pc.count_item("30149")>0 then
                                say_title("Taurean:")
                                say_verde("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_verde("Yumy! Abia astept sa il degust.")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("17.000.000 Puncte de experienta")
                                say_reward("490.000 Yang")
                                say_reward("x5 Cufar lumina lunii")
                                say_reward("x10 Boabe zen")
                                say_reward("x1 Metal magic")
                                pc.remove_item(30149,1)
                                pc.give_exp2(17000000)
                                pc.change_money(490000)
                                pc.give_item2(50011,5)
                                pc.give_item2(70102,10)
                                pc.give_item2(25041)
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(__COMPLETE__)
                   else
                           say_title("Taurean:")
                           say_verde("")
                           say_verde("Deci, unde e Bingsu? Nu e la tine?")
                           say_item_vnum(30149)
                            local s = select("Iti fac rost iar", "Gata, renunt...")
                            if s == 2 then
                                    say_title("Taurean:")
                                    say_verde("")
                                    say_verde("Ce pacat... Acum lasa-ma in pace.")
                                    clear_letter()
                                    set_state(__GIVEUP__)

                            end
                            set_state(gain_ice)
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