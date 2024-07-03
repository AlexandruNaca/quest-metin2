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
                                target.vid("__TARGET__", v, "Du-te la Administrator")
                        end
                end

                when __TARGET__.target.click or
                        9005.chat."Nu ma simt prea bine..." begin
                        target.delete("__TARGET__")
                        say_title("Administrator Depozit:")
                        say_verde("")
                        say_verde("Nu ma simt prea bine... ceva este in")
                        say_verde("neregula cu mine, probabil dupa cina")
                        say_verde("de aseara stomacul meu imi face dureri.")
                        wait()
                        say_title("Administrator Depozit:")
                        say_verde("")
                        say_verde("Octavio stie o reteta pentru stomac.")
                        say_verde("Mergi te rog frumos sa vorbesti cu el?")

                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Administrator Depozit:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Administrator Depozit:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Administrator Depozit:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Administrator Depozit:")
                        say_verde("")
                        say_verde("Du-te si vorbeste cu Octavio.")
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

                        say_title("Du-te la Octavio")
                        say_verde("")
                        say_verde("Du-te si vorbesti cu Octavio.")
                end


                when __TARGET1__.target.click or
                        20008.chat."Administratorul nu e bine" begin
                        target.delete("__TARGET1__")
                        say_title("Octavio:")
                        say_verde("")
                        say_verde("Nu se simte bine? Of, of. Iar a mancat")
                        say_verde("ca un spart aseara, ei bine, nu e nici")
                        say_verde("o problema. Stiu exact remediul pentru el.")
                        wait()
                        say_title("Octavio:")
                        say_verde("")
                        say_verde("O supa din pulpa de broasca o sa il faca")
                        say_verde("bine cat ai zice peste. Mergi sa faci rost")
                        say_verde("de pulpe de broasca de la Brotaci?")
                        local s=select("Sigur","Nu am timp")
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
                        say_verde("Du-te si omoara general brotac.")
                        set_state(accept)

                end


                end

        state accept begin

                when letter begin
                        if pc.count_item(30116)>0 then
                            send_letter("~Lv 57 - Pulpe de broasca")
                            q.set_icon("scroll_open_golden.tga")

                                local v=find_npc_by_vnum(20008)
                                if 0==v then
                                else
                                        target.vid("__TARGET__", v, "Du-te la Octavio")
                                end

                        return
                  end
                        send_letter("~Lv 57 - Ai pulpe de broasca")
                        q.set_icon("scroll_open_golden.tga")

                end

                when info or button begin
                        if pc.count_item(30116)>0 then

                                say_title("Ai pulpe de broasca")
                                say_verde("")
                                say_verde("Ai obtinut pulpe de broasca, acum")
                                say_verde("intoarce-te in sat si du-te la Octavio.")
                                return
                        end
                        say_title("Pulpe de broasca.")
                        say_verde("")
                        say_verde("Omoara general brotac pentru a obtine")
                        say_verde("pulpe de broasca, octavio are nevoie de")
                        say_verde("ele ca sa faca o supa pentru administrator.")
                end


                when 20008.chat."Pulpe de broasca" with pc.getf("subquest_26","frog_done")==1 begin


                        say_title("Octavio:")
                        say_verde("")
                        say_verde("Nu ai pulpele inca? Cand eram cam de")
                        say_verde("varsta ta, faceam rost de 10 pulpe")
                        say_verde("de broasca pe zi cel putin.")

                        local s=select("Mai incerc", "Nu am timp")
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
                        say_verde("Du-te si omoara general brotac.")

                end

                when 1302.kill begin
                        local s = number(1, 200)
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
                        20008.chat."Pulpe de broasca" with pc.count_item(30116)>=1  begin
                        target.delete("__TARGET__")

                        say_title("Octavio:")
                        say_verde("")
                        say_verde("Multumesc, acum o sa fac supa pentru")
                        say_verde("administrator si am sa io duc eu cand.")
                        say_verde("va fi gata, ai facut o treaba excelenta.")
                        wait()
                        say_title("Octavio:")
                        say_verde("")
                        say_verde("A da, era sa uit.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("20.000.000 Puncte de experienta")
                        say_reward("470.000 Yang")
                        say_reward("x5 Cufar lumina lunii")
                        say_reward("x100 Mantia curajului")
                        say_reward("x5 Piatra Spiritului")
                        pc.give_exp2(20000000)
                        pc.change_money(470000)
                        pc.give_item2(50011,5)
                        pc.give_item2(50513,5)
                        pc.give_item2(70038,100)
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