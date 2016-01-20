class DocumentsController < ApplicationController

  def index
    @document = Document.all
    @document = Document.search(params[:search])
  end
  
  def show
    @document = Document.find(params[:id])
    redirect_to :action => "index"
  end

  # def check
  #    x=Document.where("title = ?","aa")
  #    y=Client.where("name=?","a")
  #    p x[0].title
  #   p y[0].name
  #
  #   render 'new'
  # end
  def new
    @document = Document.new
  end

  def create

    #debugger
    @document = Document.new(document_params)

    file = params[:document][:file1] if params[:document].present?
    file1 = params[:document][:file2] if params[:document].present?
    #debugger
    file_name = file.original_filename if file.present?
    file1_name = file1.original_filename if file1.present?

    if file_name.present?

      if ([".pdf", ".txt"].include? File.extname(file_name))
          @document.uploadfile(params[:document][:file1])
      else
          render :text => "upload only pdf files"
          return false
      end
      end
      if file1_name.present?

         if ([".png"].include? File.extname(file1_name))
            @document.imageupload(params[:document][:file2])
            else
            render :text => "upload only png files"
            return false
         end
      end


      if @document.save
        flash[:success] = "Welcome to the Sample Document!"
        redirect_to :action => "index"
      else
        render 'new'
      end
      end


  def download_file
    @document = Document.find(params[:id])
    send_file "#{@document.file_path}"
  end

  def edit
    @document = Document.find(params[:id])

  end

  def update

    @document = Document.find(params[:id])
    if @document.update_attributes(document_params)
      redirect_to :action => "index"
    else
      render 'edit'
    end

  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to @document
  end


  private
  def document_params
    params.require(:document).permit(:title,:author,:team_name,:client_ids,:summary,:ref_link,:content_type)
  end

  end


