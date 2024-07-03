---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_26 begin
        state start begin
                when login or levelup with pc.level >= 57  and pc.level <= 59 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(9005)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la administrator")
                        end
                end

                when __TARGET__.target.click or
                        9005.chat."Nu ma simt prea bine" begin
                        target.delete("__TARGET__")
                        say_title("Administrator depozit:")
                        say("")
                        say("Nu ma simt prea bine.. am nevoie de ajutor")
                        say("urgent... trebuie sa-l intreb pe Ocvatio sa")
                        say("vad ce se intampla cu mine, ma ajuti te rog?")

                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Administrator depozit:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Administrator depozit:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Administrator depozit:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Administrator depozit:")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu octavio.")
                        set_state(ask_octavio)

                end


                end
        state ask_octavio begin
                when letter begin

                        send_letter("~Lv 57 - Du-te la Octavio")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20008)
                        if 0==v then
                        else
                                target.vid("__TARGET1__", v, "Du-te la Octavio")
                        end

                end

                when info or button begin

                        say_title("Go to Octavio")
                        say("")
                        say("Intreaba-l pe Octavio despre Administrator.")
                end


                when __TARGET1__.target.click or
                        20008.chat."Ce e cu administratorul?" begin
                        target.delete("__TARGET1__")
                        say_title("Octavio:")
                        say("")
                        say("Cred ca administratorul depozitului s-ar simti")
                        say("mult mai bine daca i-as face o supa de pulpe de ")
                        say("broaste. Du-te si omoara Lider General Brotac.")
                        say("Crezi ca esti in stare sa faci asta?")
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
                        say_verde("Du-te si omoara Lider general brotac.")
                        set_state(accept)

                end


                end

        state accept begin

                when letter begin
                        if pc.count_item(30116)>0 then
                        send_letter("~Lv 57 - Picioare de broasca")
                        q.set_icon("scroll_open_golden.tga")

                                local v=find_npc_by_vnum(20008)
                                if 0==v then
                                else
                                        target.vid("__TARGET__", v, "Du-te la Octavio")
                                end

                        return
                  end
                        send_letter("~Lv 57 - Picioare de broasca")
                        q.set_icon("scroll_open_golden.tga")

                end

                when info or button begin
                        if pc.count_item(30116)>0 then

                                say_title("Picioare de broasca")
                                say("")
                                say("Ai obtinut picioarele de broasca, du-te")
                                say("la Octavio si vorbeste cu el.")
                                say("")
                                return
                        end
                        say_title("Picioare de broasca")
                        say("")
                        say("Omoara lideri generali brotaci pana")
                        say("obtii picioare de broasca pentru octavio.")
                        say("")
                end


                when 20008.chat."Picioare de broasca" with pc.getf("subquest_26","frog_done")==1 begin


                        say_title("Octavio:")
                        say("")
                        say("Care e problema? Cand eram de varsta")
                        say("ta, faceam rost de 10 picioare de")
                        say("broasca pe zi, tu nu te descurci?")

                        local s=select("Mai incerc", "Nu am timp")
                        if 2==s then
                                say_title("Octavio:")
                                say("")
                                say("Vrei sa abandonezi misiunea?")
                                        local a=select("Da, vreau","Inchide")
                                        if  2==a then
                                                say_title("Octavio:")
                                                say("")
                                                say("Oh, ce bine ca te-ai razgandit.")
                                                return
                                        end
                                        say_title("Octavio:")
                                        say("")
                                        say("Dupa ce ma mai cauti daca esti un las?")
                                        set_state(__GIVEUP__)
                        return
                        end
                        say_title("Octavio:")
                        say("")
                        say("Du-te si omoara lideri generali brotaci.")

                end

                when 1302.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30116")==0 then
                                pc.give_item2(30116, 1)

                                if pc.count_item("30116")>=1 then
                                        local v=find_npc_by_vnum(20008)
                                        if 0 != v then
                                                target.vid("__TARGET__",v,"Du-te la Octavio")
                                        end
                                end
                        end
                end



                when __TARGET__.target.click or
                        20008.chat."Am picioare de broasca" with pc.count_item(30116)>=1  begin
                        target.delete("__TARGET__")

                        say_title("Octavio:")
                        say("")
                        say("Oh! Ai facut rost de picioare? Stai asa,")
                        say("pregatesc o supa pentru administrator.")
                        say("Sunt sigur ca o sa se simta bine dupa.")
                        wait()
                        say_title("Octavio:")
                        say("")
                        say_reward("Recompensa:" )
                        say_reward("20.000.000 Puncte de experienta")
                        say_reward("370.000 Yang")
                        say_reward("x40 Mantia curajului")
                        say_reward("x5 Cufar lumina lunii")
                        pc.give_exp2(20000000)
                        pc.change_money(370000)
                        pc.give_item2(70038, 40)
                        pc.give_item2(50011, 5)
                        pc.remove_item(30116,1)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(COMPLETE)

                end

        end

        state __GIVEUP__ begin
        end
        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end

end