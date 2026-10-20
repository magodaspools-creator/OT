function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(isPlayerGhost(cid)) then
		return true
	end

	if(item.itemid == 670) then
		doTransformItem(item.uid, 6594)
		doDecayItem(item.uid)
	elseif(item.itemid == 6580) then
		doTransformItem(item.uid, 6595)
		doDecayItem(item.uid)
    elseif(item.itemid == 6581) then
		doTransformItem(item.uid, 6596)
		doDecayItem(item.uid)
	elseif(item.itemid == 6582) then
		doTransformItem(item.uid, 6597)
		doDecayItem(item.uid)
	elseif(item.itemid == 6583) then
		doTransformItem(item.uid, 6598)
		doDecayItem(item.uid)
	elseif(item.itemid == 6584) then
		doTransformItem(item.uid, 6599)
		doDecayItem(item.uid)
	elseif(item.itemid == 6585) then
		doTransformItem(item.uid, 6600)
		doDecayItem(item.uid)
	elseif(item.itemid == 6586) then
		doTransformItem(item.uid, 6601)
		doDecayItem(item.uid)
	elseif(item.itemid == 6587) then
		doTransformItem(item.uid, 6602)
		doDecayItem(item.uid)
	elseif(item.itemid == 6588) then
		doTransformItem(item.uid, 6603)
		doDecayItem(item.uid)
	elseif(item.itemid == 6589) then
		doTransformItem(item.uid, 6604)
		doDecayItem(item.uid)
	elseif(item.itemid == 6590) then
		doTransformItem(item.uid, 6605)
		doDecayItem(item.uid)
	elseif(item.itemid == 6591) then
		doTransformItem(item.uid, 6606)
		doDecayItem(item.uid)
	elseif(item.itemid == 6592) then
		doTransformItem(item.uid, 6607)
		doDecayItem(item.uid)
	elseif(item.itemid == 6593) then
		doTransformItem(item.uid, 6608)
		doDecayItem(item.uid)
	end
	return true
end
