---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_6 begin
        state start begin
                when login or levelup with pc.level >= 11 and pc.level <= 16 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(9002)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Comanda de armura")
                        end
                end

                when __TARGET__.target.click or
                        9002.chat."Comanda de armura" with pc.level >= 11 begin
                        target.delete("__TARGET__")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Negustorul de armuri:")
                        say_verde("")
                        say_verde("L-am rugat pe fierar sa imi produca o armura")
                        say_verde("insa nu am mai auzit nimic de ea, mergi tu")
                        say_verde("sa intrebi sa vezi cum decurg lucrurile?")
                        local s=select("Sigur, ma duc","Nu am timp")
                        if 2==s then
                                say_title("Negustorul de armuri:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        return
                                end
                                say_title("Negustorul de armuri:")
                                say_verde("")
                                say_verde("Pleaca de aici, multumesc oricum!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Negustorul de armuri:")
                        say_verde("")
                        say_verde("Multumesc! Du-te la fierar si intreaba-l.")
                        set_state(ask_Fierar)
                end
        end
        state ask_Fierar begin
                when info or button begin
                        say_title("Comanda de armura")
                        say_verde("")
                        say_verde("Du-te la fierar si intreaba-l cum sta")
                        say_verde("treaba cu armura promisa fierarului.")
                end

                when letter begin
                        local v = find_npc_by_vnum(20016)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Comanda de armura")
                        end
                        send_letter("~Lv 11 - Comanda de armura")
                        q.set_icon("scroll_open_golden.tga")
                end

                when __TARGET__.target.click or
                        20016.chat."Comanda de armura" begin
                        target.delete("__TARGET__")
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Nu prea m-am ocupat de armura negustorului")
                        say_verde("de armuri, am cam dat-o in bara. Nu ma poti")
                        say_verde("ajuta tu sa fac rost de materialele necesare?")
                        local s=select("Te ajut","Nu am timp")
                        if 2==s then
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        return
                                end
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Atunci o sa ma descurc de unul singur.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Fierar:")
                        say_verde("")
                        say_verde("Multumesc, du-te si obtine materialele.")
                        set_state(to_get_material)
                end

        end
        state to_get_material begin
                when letter begin
                        send_letter("~Lv 11 - Materiale pentru armura")
                        q.set_icon("scroll_open_golden.tga")
                end
                when button or info begin
                        say_title("Materiale pentru armura")
                        say_verde("")
                        say_verde("Obtine materialele necesare pentru fierar:")
                        say_verde("")
                        if pc.getqf("ironore_done") ==1 then
                        	say_verde("Fier - Am facut rost deja.")
                        else
                        	say_verde("Fier - Pot sa fac rost de la Uriel.")
                        end
                        if pc.getqf("leather_done") ==1 then
                        	say_verde("Piele - Am facut rost deja.")
                        else
                        	say_verde("Piele - Pot sa fac rost de la Octavio.")
                        end
                        if pc.getqf("coal_done") ==1 then
                        	say_verde("Carbune - Am facut rost deja.")
                        else
                        	say_verde("Carbune - Pot sa fac rost de la Yonah.")
                        end
                end

                when letter begin
                        if pc.getqf("leather_done")!=1 then
                                local v=find_npc_by_vnum(20008)
                                if 0!=v then
                                        target.vid("__TARGET1__",v,"Du-te la Octavio.")
                                end
                        end

                        if pc.getqf("ironore_done")!=1 then
                                local v=find_npc_by_vnum(20011)
                                if 0!=v then
                                        target.vid("__TARGET2__",v,"Du-te la Uriel.")
                                end
                        end

                        if pc.getqf("coal_done")!=1 then
                                local v=find_npc_by_vnum(20005)
                                if 0!=v then
                                        target.vid("__TARGET3__",v,"Du-te la Yonah.")
                                end
                        end
                end

                when 20011.chat."Am nevoie de fier" with pc.getf("subquest_6","ironore_done") == 0 begin
                        target.delete("__TARGET2__")
                        if pc.count_item(30132) >= 1 then
                                pc.setqf("ironore_done", 1)
                                pc.remove_item("30132", 1)

                                say_title("Uriel:")
                                say_verde("")
                                say_verde("Multumesc pentru carte, poftim fierul.")
                                if  pc.getqf("ironore_done") == 1 and pc.getqf("leather_done") == 1 and pc.getqf("coal_done") == 1 then
                                        set_state(back_to_Fierar)
                                end
                                return
                        end
                        say_title("Uriel:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Daca vrei fier eu iti pot da, dar am")
                        say_verde("nevoie sa faci ceva pentru mine mai")
                        say_verde("intai. Mi-am pierdut cartea la cainii")
                        say_verde("flamanzi! Fa ros de carte pentru mine.")
                        say_item_vnum("30132")
                        say_reward("Omoara cativa caini salbatici flamanzi.")
                        pc.setqf("for_iron",1)

                end
                when 20011.chat."Am nevoie de fier" with pc.getf("subquest_6","ironore_done")==1 begin
                                target.delete("__TARGET2__")
                                say_title("Uriel:")
                                say_verde("")
                                say_verde("Ti-am dat deja fier, ce mai vrei acum?")
                end
                when 20008.chat."Am nevoie de piele" with pc.getf("subquest_6","leather_done") == 0 begin
                        target.delete("__TARGET1__")
                        if pc.count_item(60001) >= 1 then
                                pc.setqf("leather_done", 1)
                                pc.remove_item("60001", 1)

                                say_title("Octavio:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Multumesc pentru fiere, poftim pielea.")
                                if pc.getqf("ironore_done") == 1 and pc.getqf("leather_done") == 1 and pc.getqf("coal_done") == 1 then

                                        set_state(back_to_Fierar)
                                end
                                return
                        end
                        say_title("Octavio:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Daca vrei piele eu iti pot da, dar am")
                        say_verde("nevoie sa faci ceva pentru mine mai")
                        say_verde("intai. Am nevoie de fiere de la ursi.")
                        say_item_vnum("60001")
                        say_reward("Omoara cativa ursi si fa-mi rost de fiere.")
                        pc.setqf("for_leather",1)

                end
                when 20008.chat."Am nevoie de piele" with pc.getf("subquest_06","leather_done")==1 begin
                                target.delete("__TARGET1__")
                                say_title("Octavio:")
                                say_verde("")
                                say_verde("Ti-am dat deja piele, ce mai vrei acum?")
                end


                when 20005.chat."Am nevoie de carbune" with pc.getf("subquest_6","coal_done") == 0 begin
                        target.delete("__TARGET3__")
                        if pc.count_item(30044) >= 1 then
                                pc.setqf("coal_done", 1)
                                

                                say_title("Yonah:")
				say_verde("")
                                say_verde("Multumesc pentru lut, poftim carbunele.")
                                pc.remove_item(30044, 1)
                                if  pc.getqf("ironore_done") == 1 and pc.getqf("leather_done") == 1 and pc.getqf("coal_done") == 1 then
                                        set_state(back_to_Fierar)

                                end
                                return
                        end
                        say_title("Yonah:")
			say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Daca vrei carbune eu iti pot da, dar am")
                        say_verde("nevoie sa faci ceva pentru mine mai")
                        say_verde("intai. Am nevoie de lut de la mistreti.")
                        say_item_vnum("30044")
                        say_reward("Du-te si omoara cativa misterti rosii.")
                        pc.setqf("for_coal",1)
                end
                when 20005.chat."Am nevoie de carbune" with pc.getf("subquest_6","coal_done")==1 begin
                                target.delete("__TARGET3__")
                                say_title("Yonah:")
                                say_verde("")
                                say_verde("Ti-am dat deja carbune, ce mai vrei acum?")
                end

                when 171.kill begin
                        local s = number(1, 50)
                        if s <= 5 and pc.count_item(30132)==0  then
                                pc.give_item2(30132, 1)
                        end
                end


                when 110.kill  begin
                        local s = number(1, 50)
                        if s <= 5 and pc.count_item(60001)==0  then
                                pc.give_item2(60001, 1)
                        end
                end

                when 109.kill  begin
                        local s = number(1, 50)
                        if s <= 5 and pc.count_item(30044)==0  then
                                pc.give_item2(30044, 1)
                        end
                end

                when 20016.chat."Am toate materialele" begin
                        target.delete("__TARGET__")
                        if pc.getqf("ironore_done") != 1 then
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Se pare ca nu ai fier, du-te la Uriel.")
                                return
                        end

                        if pc.getqf("leather_done") != 1 then
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Se pare ca nu ai piele, du-te la Octavio.")
                                return
                        end
                        if pc.getqf("coal_done") != 1 then
                                say_title("Fierar:")
                                say_verde("")
                                say_verde("Se pare ca nu ai carbune, du-te la Yonah.")
                                return
                        end
                end
        end
        state back_to_Fierar begin
                when letter begin
                        send_letter("~Lv 11 - Ai toate materialele")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20016)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Du-te la fierar")
                        end
                end
                when info or button begin
                        say_title("Ai toate materialele")
			say_verde("")
			say_verde("Ai obtinut toate mateiralele, du-te la")
                        say_verde("fierar cu ele si vorbeste cu el.")
                end

                when __TARGET__.target.click or
                        20016.chat."Am toate materialele" with pc.getf("subquest_6","ironore_done") == 1 and pc.getf("subquest_6","leather_done") == 1 and pc.getf("subquest_6","coal_done") == 1 begin
                                say_title("Fierar:")
				say_verde("")
				----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Ai facut rost de toate materialele?")
                                say_verde("Perfect, poftim armura pentru negustor.")
                                set_state(resource_complete)
                end
        end
        state resource_complete begin
                when info or button begin
                        say_title("Comanda de armura")
			say_verde("")
                        say_verde("Ai obtinut armura promisa de la fierar,")
                        say_verde("du-te cu ea la negustorul de armuri.")
                end

                when letter begin
                        send_letter("~Lv 11 - Comanda de armura")
                        q.set_icon("scroll_open_golden.tga")

                    local v=find_npc_by_vnum(9002)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Negustorul de armuri")
                        end
                end


                when __TARGET__.target.click or
                        9002.chat."Comanda de armuri" begin
                        target.delete("__TARGET__")
                        say_title("Negustor de armuri:")
                        say_verde("")
                        say_verde("Oh, in sfarsit, armura de la fierar.")
                        say_verde("Multumesc ca te-ai ocupat de aceasta")
                        say_verde("problema pentru mine, m-ai impresionat.")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("20.000 Puncte de experienta")
                        say_reward("30.000 Yang")
                        say_reward("x2 Cufar lumina lunii")
			if pc.job == 0 then
                                reward = 11227
                                say_reward("x1 Platosa de Tigru+7")
                        elseif pc.job == 1 then
                                reward = 11427
                                say_reward("x1 Costum rosu scarlatin+7")
                        elseif pc.job == 2 then
                                reward = 11627
                                say_reward("x1 Platosa Ghinion+7")
                        else
                                reward = 11827
                                say_reward("x1 Vesmant trandafiriu+7")
                        end
                        pc.give_item2(reward, 1)
                        pc.give_exp2(20000)
                        pc.change_money(30000)
                        pc.give_item2(50011,2)
                        set_quest_state("levelup","run")
	                pc.setqf("ironore_done",0)
                        pc.setqf("leather_done" ,0)
                        pc.setqf("coal_done",0)
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