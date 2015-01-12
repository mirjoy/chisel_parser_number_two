require './lib/chisel_redo'

document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in **Food & Wine** this place has been packed every night."

*Here is a **bold** inside an italic.*

**Here is an *italic* inside a bold.**
'

parser = Chisel.new
output = parser.parse(document)
puts output
