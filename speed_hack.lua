gg.toast("script by kyh#8317")

prompt = gg.prompt({'Put the speed you want'},{'2'},{'number'})

gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
gg.clearResults()
gg.searchNumber("0000803FrD;ABAAAA3ErD;8FC2F53CrD::9", gg.TYPE_DWORD)
gg.refineNumber("1065353216", gg.TYPE_DWORD)
values = gg.getResults(gg.getResultsCount())
gg.editAll("1,065,353,216", gg.TYPE_DWORD)

t = {}
t[1] = {}
t[1].address = values[1].address + 0
t[1].flags = gg.TYPE_FLOAT
t[1].value = prompt[1]
t[1].freeze = false
gg.setValues(t)
gg.setVisible(false)

if gg.getResultsCount(values) ~= 0 then
	gg.clearResults()
	gg.setVisible(true)
	gg.toast("speed hack has been activated!")
end
