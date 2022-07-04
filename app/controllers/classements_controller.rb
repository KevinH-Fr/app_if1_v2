class ClassementsController < ApplicationController
  before_action :set_classement, only: %i[ show edit update destroy ]

  def index
    @classements = Classement.all
    @divisions = Division.all
    @events = Event.all
    @saisons = Saison.all
    @pilotes = Pilote.all
    @resultats = Resultat.all
    @resultatsFiltres = Resultat.all

    @resultat = Resultat.all



    ####################################

    # scopes depuis model resultat :
    @valeursModel = Resultat.with_value






  #  @resVal1 = Resultat.valeur1
    #@resVal2 = Resultat.valeur2

    








    @q = Classement.ransack(params[:q])

    if params[:saisonId]
      @saisonId = params[:saisonId]
    end

    if params[:divisionId]
      @divisionId = params[:divisionId]

      @eventsFiltres = @events.where('saison_id = :saison_id AND division_id = :division_id',
        saison_id: @saisonId, division_id: @divisionId)
    end
  
    if params[:eventId]
      @eventId = params[:eventId]
      @eventNum = Event.find(@eventId).numero 

      @resultatsFiltres = @resultats.where('event_id <= :event_id',
                   event_id: @eventId)

      @divisionId = Event.find(@eventId).division_id 

      @pilotes = Pilote.all
      @pilotesActifDiv = Pilote.all.where(statut: "actif", division_id: @divisionId)  

      #@piloteId = 12

      

     # rependre et essayer de recuperer le score et de le trier ici
     #comprendre pourquoi solution mise de coté

     @pilotesActifDiv = Pilote.all.where(statut: "actif", division_id: @divisionId)
                        

     pilotesActifDiv = Pilote.all.where(statut: "actif", division_id: @divisionId)
                        .order("id ASC")  
        
     @pilotesActifDiv.each do |pilote| 

         @valTest = pilote.nom
         @valTest2 = pilote.id


         @valeursModel = Resultat.with_mt #depuis model


        # essayer de calculer le score de chaque pilote ici 
          vals = [
          Resultat.joins(:event).where(
          'numero <= :numero AND 
          saison_id = :saison_id AND 
          pilote_id = :pilote_id AND 
          division_id = :division_id', 
          numero: @eventNum, 
          saison_id: @saisonId, 
          pilote_id: pilote.id, 
          division_id: @divisionId).sum(:score)
          ]

     end 


          ########  nouveau test calcul dans controller ###################
          @resultatsFiltres = Resultat.all
         # @resultatsFiltres = Resultat.where(
           # 'event_id = :event_id',
           #  event_id: @eventId
         # )

          @resultatsFiltres = Resultat.joins(:event).where(
            'saison_id = :saison_id AND 
             event_id <= :event_id AND 
             division_id = :division_id',  
             saison_id: params[:saisonId],
             event_id: params[:eventId],
             division_id: params[:divisionId]
          )


              ########  nouveau test calcul dans controller ###################

              @resultatsFiltresBis = Resultat.group(:pilote_id).joins(:event).where(
                'saison_id = :saison_id AND 
                 event_id <= :event_id AND 
                 division_id = :division_id',  
                 saison_id: params[:saisonId],
                 event_id: params[:eventId],
                 division_id: params[:divisionId]
              )

         ########  nouveau test 3 calcul dans controller ###################

         @resultatsFiltresTer = Resultat.joins(:event).where(
          'numero <= :numero AND 
           saison_id = :saison_id AND 
           division_id = :division_id',  
           numero: params[:numGp],
           saison_id: params[:saisonId],
           division_id: params[:divisionId]
        )

   

      
       @holdings2 = @resultatsFiltresTer.select(:pilote_id, :score, 
        "SUM(score) as sum_amount")
        .group(:pilote_id)
        .sum(:score)

        @holdings3 = @resultatsFiltresTer.select(:pilote_id, :score, 
          "SUM(score) as sum_amount")
          .group(:pilote_id)
          .sum(:score)
          
        #  @holdings3 = []
          @holdings4 = Resultat.joins(:event).where(
            'numero <= :numero AND 
             saison_id = :saison_id AND 
             division_id = :division_id',  
             numero: params[:numGp],
           saison_id: params[:saisonId],
           division_id: params[:divisionId]
          ).order('score DESC').select(:pilote_id, :score, 
          "SUM(score) as sum_amount")
          .group(:pilote_id)
          .sum(:score)
         
          

        



            @scores = [
              {name: "Superman", score: 745},
              {name: "Ironman", score: 9},
              {name: "Batman", score: 10}
            ]
            
            @scoresBis = Array.new(4) {|i| i.to_s }

            @scoresTer = [
              1, "two", 3.0
            ]

           

           # @scores = @scores.sort_by { |h | h[:name] }
            @scores = @scores.sort_by { |h | -h[:score] }

        #    @scoresBis = @scoresBis.sort_by { |h | h[:nom] }


         #  @holdings5 = @holdings4.sort_by { |h | h[:pilote_id] }





        #  @holdings3 = @holdings3.reverse if sort_direction == 'DESC'
        #  @holdings3 = @holdings3.paginate(:page => params[:page], :per_page => 5)


      # User.joins(:results).group("users.id").order("SUM(results.points) DESC")
        # .group("pilote_id")
        #@resultatsFiltresQuart =  @resultatsFiltresTer.group(:pilote_id)
       # @resultatsFiltresQuint =  @resultatsFiltresQuart.sum(:score)

       ###################


       @test6 = Resultat.joins(:event).where(
          'numero <= :numero AND 
          saison_id = :saison_id AND 
          division_id = :division_id',   
          numero: params[:numGp],
          saison_id: params[:saisonId],
          division_id: params[:divisionId])
        .select(:pilote_id, "sum(score) as sum_amount")
        .group(:pilote_id)
        .order(:sum_amount)
        .sum(:score)

        @test7 = Resultat.joins(:event).where(
          'numero <= :numero AND 
           saison_id = :saison_id AND 
           division_id = :division_id',  
           numero: params[:numGp],
           saison_id: params[:saisonId],
           division_id: params[:divisionId])

          @test7 = @test7.select(:pilote_id, "sum(score) as sum_amount").group(:pilote_id).order(
            "sum(score) desc").sum(:score)
            

    else
      
      @resultats = Resultat.all
      @resultatsFiltres = Resultat.all
      @pilotesActifDiv = Pilote.all
    end

    respond_to do |format|
      format.html
      format.pdf do

       render pdf: "classementPilotes", template: "classements/liste", formats: [:html], layout: "pdf"
      end
    end


  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_classement
      @classement = Classement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def classement_params
      params.fetch(:classement, {})
    end


   
end
