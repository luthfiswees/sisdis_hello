
require 'savon'
require 'carrierwave/orm/activerecord'
require 'base64'
require 'net/http'
require 'uri'
require 'faraday'

class HelloModelsController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  before_action :set_hello_model, only: [:show, :edit, :update, :destroy]

  def pr2
  end

  def pr3
  end

  def pr4
  end

  def pr5
  end

  def tugas1
  end

  #buat nyoba sisprog hehe
  def cobasysprog
  end

  #buat nyoba sisprog hehe
  def nyalain
    conn = Faraday.new(:url => 'http://jemuran-server-sails.herokuapp.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.post '/store_status', { status: "true"}
    render "cobasysprog"
  end

  #buat nyoba sisprog hehe
  def matiin
    conn = Faraday.new(:url => 'http://jemuran-server-sails.herokuapp.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.post '/store_status', { status: "false"}
    render "cobasysprog"
  end

  def ping
    conn = Faraday.new(:url => 'https://kurnia.sisdis.ui.ac.id/ewallet') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get("/ewallet/ping")
    @response_ping = response.body
  end

  def getSaldo
    conn = Faraday.new(:url => 'https://kurnia.sisdis.ui.ac.id/ewallet') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get("/ewallet/getSaldo/" + params[:user_id])
    @response_get_saldo = response.body    
  end

  def getTotalSaldo
    conn = Faraday.new(:url => 'https://kurnia.sisdis.ui.ac.id/ewallet') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get("/ewallet/getTotalSaldo/" + params[:user_id])
    @response_get_total_saldo = response.body
  end

  def transfer
    conn = Faraday.new(:url => 'https://kurnia.sisdis.ui.ac.id/ewallet') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.post "/ewallet/transfer", { user_id: params['user_id'], nilai: params['nilai']}
    @response_transfer = response.body
  end

  def register
    conn = Faraday.new(:url => 'https://kurnia.sisdis.ui.ac.id/ewallet') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.post "/ewallet/register", { user_id: params['user_id'], nilai: params['nama'], ip_domisili: params['ip_domisili']}
    @response_register = response.body
  end

  def view_image
    @tuple = Image.where( filename: params[:filename] ).first
    
    render 'view_image.html.erb'
  end

  def post_image
    uploaded_io = params[:picture]

    filename = uploaded_io.original_filename
    filesize = uploaded_io.size / 1000
    fileimage = Base64.encode64(uploaded_io.read)

    @image = Image.create(
	:filename  => filename,
	:filesize  => filesize,
	:fileimage => fileimage
    )
    
    @image.save    

    @uploaded = "Gambar #{filename} dengan ukuran #{filesize} KB berhasil diupload"

    render 'pr4'
  end

  def hello_soap
    @url_wsdl = params[:url_wsdl]
    @input_text = params[:input_text]

    client = Savon.client( wsdl: @url_wsdl )

    client.operations

    response = client.call(:hello, message: { input: @input_text } )

    @input_text = response.to_hash
    render 'pr3'
  end

  # GET /hello_models
  # GET /hello_models.json
  def index
    @hello_models = HelloModel.all
  end

  # GET /hello_models/1
  # GET /hello_models/1.json
  def show
  end

  # GET /hello_models/new
  def new
    @hello_model = HelloModel.new
  end

  # GET /hello_models/1/edit
  def edit
  end

  # POST /hello_models
  # POST /hello_models.json
  def create
    @hello_model = HelloModel.new(hello_model_params)

    respond_to do |format|
      if @hello_model.save
        format.html { redirect_to @hello_model, notice: 'Hello model was successfully created.' }
        format.json { render :show, status: :created, location: @hello_model }
      else
        format.html { render :new }
        format.json { render json: @hello_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hello_models/1
  # PATCH/PUT /hello_models/1.json
  def update
    respond_to do |format|
      if @hello_model.update(hello_model_params)
        format.html { redirect_to @hello_model, notice: 'Hello model was successfully updated.' }
        format.json { render :show, status: :ok, location: @hello_model }
      else
        format.html { render :edit }
        format.json { render json: @hello_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hello_models/1
  # DELETE /hello_models/1.json
  def destroy
    @hello_model.destroy
    respond_to do |format|
      format.html { redirect_to hello_models_url, notice: 'Hello model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hello_model
      @hello_model = HelloModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hello_model_params
      params.require(:hello_model).permit(:hellotext, :uptime)
    end
end
