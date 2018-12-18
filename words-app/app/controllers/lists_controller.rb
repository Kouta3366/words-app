class ListsController < ApplicationController
  before_action :before_card3, {only:[:card3]}

  def before_card3
    @rcards = Rcard.where(list_id: params[:id1])
    @rcards.each do |rcard|
      rcard.destroy
    end
    @cards = Card.order("RANDOM()").where(list_id: params[:id1])
    @cards.each do |card|
      @rcard = Rcard.new(list_id: card.list_id,
                         word: card.word,
                         meaning: card.meaning)
      @rcard.save
    end
  end

  def start
    @list = List.find_by(id: params[:id])
    @cards = Card.where(list_id: @list.id)
    @i = 0
    @cards.each do |card|
      @i = @i + 1
    end
    if @i == 0
      redirect_to("/lists/#{params[:id]}/show")
      flash[:notice] = "単語を作成してください"
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(user_id: @current_user.id, list_name: params[:list_name])
    if @list.save
      redirect_to("/lists/#{@list.id}/show")
    else
      render("lists/new.html.erb")
    end
  end

  def show
    @list = List.find_by(id: params[:id])
    @lists = List.where(user_id: @current_user.id)
    @cards = Card.where(list_id: params[:id])
  end

  def edit
    @list = List.find_by(id: params[:id])
    @card = Card.new
  end

  def new_card
    @card = Card.new(list_id: params[:id], word: params[:word], meaning: params[:meaning])
    if @card.save
      redirect_to("/lists/#{params[:id]}/show")
      flash[:notice] = "作成しました"
    else
      @list = List.find_by(id: @card.list_id)
      @word = params[:word]
      @meaning = params[:meaning]
      render("lists/edit.html.erb")
    end
  end

  def edit2
    @card = Card.find_by(id: params[:id])
    @list = List.find_by(id: @card.list_id)
  end

  def card1
    @cards = Card.where(list_id: params[:id1])
    @no = params[:id2].to_i
    @card = @cards[@no]
    if @card == nil
      redirect_to("/lists/end")
    end
  end

  def card2
    @cards = Card.where(list_id: params[:id1])
    @no = params[:id2].to_i
    @card = @cards[@no]
    if @card == nil
      redirect_to("/lists/end")
    end
  end

  def card3
    sleep(3)
    @no = 0
    @rcards = Rcard.where(list_id: params[:id1])
    @card = @rcards[0]
  end

  def card5
    @no = params[:id2].to_i
    @rcards = Rcard.where(list_id: params[:id1])
    @card = @rcards[params[:id2].to_i]
    if @card == nil
      redirect_to("/lists/end")
    end
  end

  def card4
    @no = params[:id2].to_i
    if @no == 0
      @rcards = Rcard.where(list_id: params[:id1])
      @rcards.each do |rcard|
        rcard.destroy
      end
      @cards = Card.order("RANDOM()").where(list_id: params[:id1])
      @cards.each do |card|
        @rcard = Rcard.new(list_id: card.list_id,
                           word: card.word,
                           meaning: card.meaning)
        @rcard.save
      end
    end
    @rcards = Rcard.where(list_id: params[:id1])
    @card = @rcards[@no]
    if @card == nil
      redirect_to("/lists/end")
    end
  end

  def end
  end

  def update
    @card = Card.find_by(id: params[:id])
    @card.word = params[:word]
    @card.meaning = params[:meaning]
    if @card.save
      redirect_to("/lists/#{@card.list_id}/show")
      flash[:notice] = "変更しました"
    else
      @list = List.find_by(id: @card.list_id)
      render("lists/edit2.html.erb")
    end
  end

  def destroy
    @card = Card.find_by(id: params[:id])
    @list = List.find_by(id: @card.list_id)
    if @card.destroy
      flash[:notice] = "削除しました"
      redirect_to("/lists/#{@list.id}/show")
    end
  end
end
