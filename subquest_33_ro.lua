---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_33 begin
        state start begin
                when login or levelup or enter with pc.get_level() >=44  and pc.get_level() <= 46 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20023)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Du-te la Soon")
                        end
                end


                when __TARGET__.target.click or
                        20023.chat."Hartile comorilor" with pc.level >= 44 begin
                        target.delete("__TARGET__")
                        say_title("Soon:")
                        say_verde("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_verde("Razboinicule, am nevoie de ajutorul tau!")
                        say_verde("")
                        say_verde("Caut hartile comorilor dar nu le pot obtine")
                        say_verde("de la animalele salbatice, aceste carti se")
                        say_verde("pot obtine de la animalele din acest sat:")
                        say_verde("Lykos, Scrofa, Bera si Tigris.")
                        wait()
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Ma ajuti sa fac rost de aceste harti?")
                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Soon:")
                        say_verde("")
                        say_verde("Du-te si fa rost de materiale!")
                        set_state(to_gain_map)
                end
        end

        state to_gain_map begin

                when letter begin
                        send_letter("~Lv 44 - Hartile comorilor")
                        q.set_icon("scroll_open_golden.tga")

                        if  pc.count_item(27988) ==4 then
                                local v = find_npc_by_vnum(20023)

                                if v != 0 then
                                        target.vid("__TARGET__", v, "Du-te la Soon")
                                end
                                return
                        end

                end

                when info or button begin
                        if  pc.count_item(27988) >=4 then
                                say_title("Inapoi la Soon")
                                say_verde("")
                                say_verde("Ai obtinut toate hartiile comorilor, du-te" )
                                say_verde("acum si vorbeste cu Soon, te asteapta.")
                                say_verde("I'll carry them to Mr.Soon")
                                 return
                        end
                        say_title("Hartile comorilor")
                        say_verde("")
                        say_verde("Obtine hartile comorilor de la animalele")
                        say_verde("salbatice din primul sat, acestea sunt:")
                        say_verde("Lykos, Scrofa, Bera, Tigris." )
                        say_verde("")
                        say_reward("Pana acum ai gasit: "..pc.count_item(27988).." harti.")
                end


                when 191.kill begin
                        if        pc.getqf("kill_g1")==0 then
                                pc.give_item2(27988, 1)
                        end

                        pc.setqf("kill_g1",1)
                        if        pc.getqf("kill_g1")==1        and        pc.getqf("kill_g2")==1 and        pc.getqf("kill_g3")==1        and        pc.getqf("kill_g4")==1 then
                                set_state(hunt_reward)
                        end
                        return
                end
                when 192.kill begin
                        if        pc.getqf("kill_g2")==0 then
                                pc.give_item2(27988, 1)
                        end

                        pc.setqf("kill_g2",1)

                        if        pc.getqf("kill_g1")==1        and        pc.getqf("kill_g2")==1 and        pc.getqf("kill_g3")==1        and        pc.getqf("kill_g4")==1 then
                                set_state(hunt_reward)
                        end
                        return
                end

                when 193.kill begin
                        if        pc.getqf("kill_g3")==0 then
                                pc.give_item2(27988, 1)
                        end

                        pc.setqf("kill_g3",1)

                        if        pc.getqf("kill_g1")==1        and        pc.getqf("kill_g2")==1 and        pc.getqf("kill_g3")==1        and        pc.getqf("kill_g4")==1 then
                                set_state(hunt_reward)
                        end
                        return
                end

                when 194.kill begin
                        if        pc.getqf("kill_g4")==0 then
                                pc.give_item2(27988, 1)
                        end

                        pc.setqf("kill_g4",1)

                        if        pc.getqf("kill_g1")==1        and        pc.getqf("kill_g2")==1 and        pc.getqf("kill_g3")==1        and        pc.getqf("kill_g4")==1 then
                                set_state(hunt_reward)
                        end
                        return
                end
        end

        state hunt_reward begin
                when letter begin
                        send_letter("~Lv 44 - Inapoi la Soon")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v = find_npc_by_vnum(20023)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Du-te la Soon")
                        end
                end

                when info or button begin
                                say_title("Inapoi la Soon")
                                say_verde("")
                                say_verde("Ai obtinut toate hartiile comorilor, du-te" )
                                say_verde("acum si vorbeste cu Soon, te asteapta.")
                                say_verde("I'll carry them to Mr.Soon")
                end

        when __TARGET__.click  or
                20023.chat."Am obtinut hartile" begin
                        target.delete("__TARGET__")
                        if pc.count_item(27988)>=4 then
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Oh, multumesc! Uite, spune ca s-ar putea sa")
                                say_verde("exista o comoara intradevar langa batran!")
                                say_verde("")
                                say_verde("Te duci pana acolo sa verifici te rog?")
                                local s=select("Ma duc","Nu am timp")
                                if 2==s then
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Vrei sa abandonezi misiunea?")
                                        say_verde("")
                                        local a=select("Da, vreau","Inchide")
                                        if  1==s then
                                                say_title("Soon:")
                                                say_verde("")
                                                say_verde("Treaba ta, ai ajuns pana aici...")
                                                pc.remove_item(27988,4)
                                                set_state(__GIVEUP__)
                                                return
                                        end
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Du-te la batran si verifica daca chiar")
                                        say_verde("exista o comoara adevarata sau nu.")
                                        set_state(to_gain_tresure)
                                        return

                                end
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Du-te la batran si verifica daca chiar")
                                say_verde("exista o comoara adevarata sau nu.")
                                set_state(to_gain_tresure)
                                return
                        else
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Nu ai toate hartile comorii la tine.")
                                say_verde("Vrei sa mergi sa le cauti pe restul?")
                                say_verde("")
                                local s=select("Ma duc","Nu am timp")
                                if 2==s then
                                        say_title("Soon:")
                                        say_verde("")
                                        say_verde("Pacat... O zi placuta, la revedere.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Stiam ca ma pot baza pe tine.")
                end

        end
end
        state to_gain_tresure begin
                when letter begin
                        send_letter("~Lv 44 - Hartile comorilor")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20009)  -----------old man
                                if 0 == v then
                                else
                                        target.vid("__TARGET__",v,"Batran")
                                end

                end

                when info or button begin
                        say_title("Hartile comorilor")
                        say_verde("")
                        say_verde("Soon te-a trimis la batran sa verifici")
                        say_verde("daca chiar exista o comoara adevarata.")
                end


                when __TARGET__.target.click or
                        20009.chat."Hartile comorilor" with pc.count_item(27988)>=4 begin
                         target.delete("__TARGET__")
                         say_title("Batran:")
                         say_verde("")
                         say_verde("Intradevar, coordonatele de pe aceste")
                         say_verde("harti ale cmorilor, oh uite! Un cufar.")
                         say_item_vnum(70009)
                         pc.give_item2(70009, 1)
                         set_state(go_to_reward)
                 end

        end

        state go_to_reward begin
                when letter begin
                        send_letter("~Lv 44 - Inapoi la Soon")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20023)
                                if 0 == v then
                                else
                                        target.vid("__TARGET__",v,"Inapoi la Soon")
                                end

                end

                when info or button begin
                        say_title("Inapoi la Soon")
                        say_verde("")
                        say_verde("Ai gasit comoara, aceasta chiar exista.")
                        say_verde("Intoarce-te la Soon si vorbeste cu el.")
                end


                when __TARGET__.click or
                        20023.chat."Hartile comorilor"  begin
                        target.delete("__TARGET__")
                        if pc.count_item(70009)>=1 then
                                say_title("Soon:")
                                say_verde("")
                                say_verde("Oh, ce surpriza placuta. Multumesc mult.")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("6.000.000 Puncte de experienta")
                                say_reward("240.000 Yang")
                                say_reward("x4 Cufar lumina lunii")
                                say_reward("x1 Scut rotund negru+4")
                                pc.remove_item(70009,1)
                                pc.remove_item(27988,4)
                                pc.give_exp2(6000000)
                                pc.change_money(240000)
                                pc.give_item2(50011,4)
                                pc.give_item2(13040,1)

                                if pc.job == 0 then
                                        pc.give_item2(12244, 1)
                                        say_reward("x1 Coif masca stafiei+4")
                                elseif pc.job == 1 then
                                        pc.give_item2(12524, 1)
                                        say_reward("x1 Coif cetate+4")
                                elseif pc.job == 2 then
                                        pc.give_item2(12384, 1)
                                        say_reward("x1 Gluga de otel+4")
                                elseif pc.job == 3 then
                                        pc.give_item2(12664, 1)
                                        say_reward("x1 Palarie lum. soarelui+4")
                                end
                                
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(__COMPLETE__)
                        else
                                say_title("Soon:")
                                say_verde("")
                                say_verde("You haven't found him yet, have you?")
                                say_verde("")
                                return

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