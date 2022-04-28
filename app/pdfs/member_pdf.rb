class MemberPdf < Prawn::Document

  def initialize(resumes)
    super()
    @res = Resume.order("id ASC").all
    resume_id
  end

  def resume_id

    table resume_id_all do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end

  end

  def resume_id_all
    [["id", "Image Url","Name", "Contact_no,", "CNIC", "Address"]] +
    @res.map do |resume|
      [resume.id, resume.avatar_url, resume.name, resume.phone_no, resume.cnic, resume.address]
    end
  end
end
