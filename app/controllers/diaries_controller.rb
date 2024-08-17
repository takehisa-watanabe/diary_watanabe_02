class DiariesController < ApplicationController
  before_action :set_diary, only: %i[ show edit update destroy ]

  # GET /diaries or /diaries.json
  def index

    @diaries = Diary.all

    yousosuu = @diaries.size

    for number in 1..yousosuu do
      this_diary =  @diaries[number-1]
      writer_id = this_diary.person_id
      
      if writer_id == nil
        writer_name = "<なし>"
      else
        writer = Person.find(writer_id)
        writer_name = writer.name
      end
      this_diary.update(writtenbyname:writer_name)
    end

    #p "==="
    #p @diaries

    @diaries = Diary.all
 
  end

  # GET /diaries/1 or /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
    @writers = Person.all
  end

  # POST /diaries or /diaries.json
  def create
    @diary = Diary.new(diary_params)

    respond_to do |format|
      if @diary.save
        format.html { redirect_to diary_url(@diary), notice: "Diary was successfully created." }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1 or /diaries/1.json
  def update
    respond_to do |format|
      p "=============="  + diary_params.to_s + "=============="
      if @diary.update(diary_params)
        if @diary.person_id == nil
          writer_name = "<なし>"
        else
          writer_id = @diary.person_id
          writer_name = Person.find(writer_id).name
        end

        @diary.update(writtenbyname:writer_name)
        format.html { redirect_to diary_url(@diary), notice: "Diary was successfully updated." }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1 or /diaries/1.json
  def destroy
    @diary.destroy!

    respond_to do |format|
      format.html { redirect_to diaries_url, notice: "Diary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diary_params
      params.require(:diary).permit(:title, :text, :date, :person_id)
    end
end
