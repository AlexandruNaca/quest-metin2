---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_32 begin
        state start begin
                when login  or levelup with pc.level >= 41 and pc.level <= 43 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20010)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Negustorul ambulant")
                        end
                end


                when __TARGET__.target.click or
                        20010.chat."Cererea negustorului" with pc.level >= 41 begin
                        target.delete("__TARGET__")
            ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Negustorul ambulant")
                        say_verde("")
                        say_verde("Am nevoie de 100 de masele de orc, ata de")
                        say_verde("la Ariyoung, si piatra de la negustoarea")
                        say_verde("de diverse, vrei sa ma ajuti sa fac rost?")

                        local s=select("Iti fac rost","Nu am timp")
                        if 2==s then
                                say_title("Negustorul ambulant:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Negustorul ambulant:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Negustorul ambulant:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Negustorul ambulant:")
                        say_verde("")
                        say_verde("Du-te si fa rost de materiale!")

                        set_state(gogogo)

                end
        end
        state gogogo begin

                when letter begin
                    send_letter("~Lv 41 - Cererea negustorului")
                    q.set_icon("scroll_open_golden.tga")

                        if pc.getqf("sil_done") == 0 or pc.getqf("sil_done") ==2  then
                                local v=find_npc_by_vnum(20021)
                                if 0!=v then
                                        target.vid("__TARGET1__",v,"Ariyoung")
                                end
                        end


                        if pc.getqf("sil_done")== 1  then

                                local v=find_npc_by_vnum(20003)
                                if 0!=v then
                                        target.vid("__TARGET3__",v,"Ah-Yu")
                                end
                        end


                        if pc.count_item(30144) >=100 and pc.count_item(30143)>0  then

                                local v=find_npc_by_vnum(9003)
                                if 0==v then
                                        target.vid("__TARGET2__",v,"Magazinul general")
                                end

                        end

                                if  pc.count_item(30139)>=100 and pc.count_item(30140)>0 and   pc.count_item(30141)>0  then
                                        set_state(all_item_done)
                        end


                end

                when info or button begin
                        say_title("Cererea negustorului")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Negustorul ambulant are nevoie de 100 de")
                        say_verde(" masele de orc, ata de la Ariyoung, si")
                        say_verde("piatra de la negustoarea de diverse.")

                end
                when 20021.chat."Am nevoie de ata" with pc.getf("subquest_32","sil_done") == 0 begin
                        target.delete("__TARGET1__")

                        say_title("Ariyoung:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Ariyoung:")
                        say_verde("")
                        say_verde("Iti voi da ata daca duci acest costum la")
                        say_verde("prietena mea, Ah-Yu. Ce spui, de acord?")

                        local s=select("De acord","Nu am timp")
                            if 2==s then
                            say_title("Ariyoung:")
                            say_verde("")
                            say_verde("Vrei sa abandonezi misiunea?")
                            say_verde("")
                            local a=select("Da, vreau","Inchide")
                        if  2==a then
                      say_title("Ariyoung:")
                      say_verde("")
                      ----"123456789012345678901234567890123456789012345678901234567890"|
                      say_verde("Oh, ce bine ca te-ai razgandit?")
                                else
                    say_title("Ariyoung:")
                    say_verde("")
                    say_verde("Pai dupa ce ai mai venit la mine atunci")
                    set_state(__GIVEUP__)
                                end
                        else
                say_title("Ariyoung:")
                say_verde("")
                ----"123456789012345678901234567890123456789012345678901234567890"|
                say_verde("Super atunci, du-te la Ah-Yu cu aceste")
                say_verde("haine si o sa iti dau ata dupa aia.")
                pc.give_item2(30159)
                pc.setqf("sil_done",1)
            end
                end
                when 20021.chat."Am nevoie de ata" with pc.getf("subquest_32","sil_done") == 1 begin
                                say_title("Ariyoung:")
                                say_verde("")
                                say_verde("Ti-am spus, mai intai dute cu aceste")
                                say_verde("haine la Ah-Yu, dupa iti v-oi da ata.")
                end
                when 20021.chat."Am nevoie de ata" with pc.getf("subquest_32","sil_done") == 2 begin
                                target.delete("__TARGET1__")
                                say_title("Ariyoung:")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say_verde("Multumesc ca te-ai ocupat, poftim ata.")
                                pc.give_item2(30140)
                                pc.setqf("sil_done",3)
                                if  pc.count_item(30141)>0 and  pc.count_item(30139)>=100 then
                                        set_state(all_item_done)
                                end
                end
                when 20021.chat."Am nevoie de ata" with pc.getf("subquest_32","sil_done") == 3 begin
                                say_title("Ariyoung :")
                                say_verde("")
                                say_verde("Ai primit deja ata, ce mai vrei?")

                end

                when 20003.chat."Haine de la Ariyoung" with pc.count_item(30159)>0 begin
                        target.delete("__TARGET3__")
                        say_title("Ah-Yu:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Oh, multumesc, foarte dragut din partea ei.")
                        pc.remove_item(30159)
                        pc.setqf("sil_done",2)
                end

                when 9003.chat."Am nevoie de piatra" with pc.getf("subquest_32","jewel_done")==0  begin
                        target.delete("__TARGET2__")
                        say_title("Negustoarea de diverse:")
                        say_verde("")
                        say_verde("Am nevoie de 100 de ficat de tigru si iarba")
                        say_verde("medicinala si o sa iti dau piatra.")
                        say_item_vnum(30143)
                        say_item_vnum(30144)
                        say_verde("Omoara tigri sau tigri albi.")
                        wait()
                        say_title("Negustoarea de diverse:")
                        say_verde("")
                        say_verde("Esti de acord?")
                        say_verde("")
                          local s=select("De acord","Nu am timp")
                          if 2==s then
                                say_title("Negustoarea de diverse")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                if  2==a then
                    say_title("Negustoarea de diverse:")
                    say_verde("")
                    say_verde("Oh, ce bine ca te-ai razgandit.")

                else
                    say_title("Negustoarea de diverse:")
                    say_verde("")
                    say_verde("Cum vrei tu... La revedere")
                    set_state(__GIVEUP__)
                end

                         else
                                say_title("Negustoarea de diverse")
                                say_verde("")
                                say_verde("Du-te si omoara tigri sau tigri albi.")
                                pc.setqf("jewel_done",1)
                         end
                end

                when 9003.chat."Am nevoie de piatra" with pc.getf("subquest_32","jewel_done")==1 and  pc.count_item(30143)>=1 and pc.count_item(30144)>=100 begin
                                target.delete("__TARGET2__")
                                say_title("General Dealer :")
                                say_verde("")
                                say_verde("Ai fost foarte rapid, felicitari. Poftim")
                                say_verde("piatra, ai grija de ea, o zi frumoasa.")

                                pc.give_item2(30141)

                                pc.remove_item(30143 ,1)
                                pc.remove_item(30144 ,100)
                                pc.setqf("jewel_done",2)


                                if pc.count_item(30140)>0  and  pc.count_item(30139)>=100 then
                                        set_state(all_item_done)
                                end
                end


        when 114.kill or 115.kill  begin
                                local s = number(1, 70)
                                if s <= 7 and pc.count_item(30144)<100  then
                                        pc.give_item2(30144, 2)
                                end

                                local a = number(1, 70)
                                if a <= 5 and pc.count_item(30143)== 0  then
                                        pc.give_item2(30143, 1)
                                end

                                        end


         when 634.kill  begin

                        local s = number(1, 70)
                        if s <= 7 and pc.count_item(30139)<100  then
                                pc.give_item2(30139, 2)

                                if pc.count_item(30139)>=100 and pc.count_item(30140)>0 and   pc.count_item(30141)>0 then
                                        set_state(all_item_done)
                                        return
                                end
                        end
                end

        end
        state all_item_done begin
                when letter begin
                        send_letter("~Lv 41 - Inapoi la negustor")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        local v=find_npc_by_vnum(20010)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Inapoi la negustor")
                        end
                end
                when info or button begin
                        say_title("Inapoi la negustor")
                        say_verde("")
                        say_reward("Ai obtinut toate materialele necesare.")
                        say_reward("Acum intoarce-te la negustorul ambulant.")
                end

                when __TARGET__.target.click or
                        20010.chat."Am toate materialele" begin
                        if pc.count_item(30140)>=1 and pc.count_item(30141)>=1 and  pc.count_item(30139) >= 100 then
                            target.delete("__TARGET__")
                                say_title("Negustorul ambulant")
                                say_verde("")
                                say_verde("Ai reusit? Felicitari, nu credeam ca esti")
                                say_verde("in stare sa imi confectionezi materialele.")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("5.000.000 Puncte de experienta")
                                say_reward("210.000 Yang")
                                say_reward("x4 Cufar lumina lunii")
                                say_reward("x40 Mantia curajului")

                                pc.remove_item(30140,1)
                                pc.remove_item(30141,1)
                                pc.remove_item(30139,100)
                                pc.change_money(210000)
                                pc.give_exp2(5000000)
                                pc.give_item2(50011,4)
                                pc.give_item2(70038,40)
                                pc.setqf("jewel_done",0)
                                pc.setqf("sil_done",0)
                                set_quest_state("levelup","run")
                                set_state(THEEND)
                                clear_letter()

            else
                                target.delete("__TARGET__")
                                say_title("Negustorul ambulant:")
                                say_verde("")
                                say_verde("Imi pare rau, nu ai toate materialele.")
                                local s=select("Iti fac rost","Nu am timp")
                                if 2==s then
                                say_title("Negustorul ambulant:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                    say_title("Negustorul ambulant")
                                    say_verde("")
                                    say_verde("Oh, ce bine ca te-ai razgandit.")
                                    set_state(gogogo)

                    else
                        say_title("Negustorul ambulant:")
                        say_verde("")
                        say_verde("Prea greu pentru tine? Esti un las.")
                        set_state(__GIVEUP__)
                    end
                                else
                    say_title("Negustorul ambulant:")
                    say_verde("")
                    say_verde("Oh, ce bine ca te-ai razgandit.")
                    set_state(gogogo)
                                end
                    end

                end
        end



        state __GIVEUP__ begin
        end
    state THEEND begin
                when enter begin
                        q.done()
                end
        end
end