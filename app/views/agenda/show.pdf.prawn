Pdf.text “Agenda for $%^&$", :size => 30, :style => :bold

pdf.move_down(30)

Items = @agenda.map do |item|
[
item.agenda.location,
item.agenda.activity_1,
item.agenda.activity_2,
item.agenda.activity_3,
item.agenda.activity_4,
item.agenda.activity_5,
item.agenda.activity_6,
item.agenda.snack,
item.agenda.patches,
item.agenda.supplies,
item.agenda.jobs,
item.agenda.troop_info,
etc.
]
pdf.text
end


pdf.table items, :border_style => :grid,
:row_colors => [“FFFFFF”, “DDDDDD”],
:headers => [“Product”, “Qty”],
:align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }

pdf.move_down(10)

pdf.text “Total Price:”, :size => 16, :style => bold


