import React, { useEffect, useState } from 'react';
import Style1 from './Style1';
import Style2 from './Style2';
import Style3 from './Style3';
import { useData } from 'contexts/DataContext';
import { AnimatePresence, motion as m } from 'framer-motion';
import { useNuiEvent } from 'hooks/useNuiEvent';

const TYPES = {
	1: Style1,
	2: Style2,
	3: Style3,
};
export default function CarHud({ isInMove }) {
	const { carhudStyle, carhudSize, updatePosition, getPosition } = useData();
	const [display, setDisplay] = useState(false);
	const [vehicleData, setVehicleData] = useState({
		speed: 20,
		previousGear: 'R',
		gear: 'N',
		nextGear: '1',
		fuel: 60,
		nitrous: 40,
		rpm: 12,
	});

	useNuiEvent('setCarDisplay', setDisplay);
	useNuiEvent('updateCarHud', setVehicleData);

	useEffect(() => {
		if (!isInMove) return;

		setDisplay(true);
		setVehicleData({
			speed: 20,
			previousGear: 'R',
			gear: 'N',
			nextGear: '1',
			fuel: 60,
			nitrous: 40,
			rpm: 12,
		});
	}, [isInMove]);

	return (
		<AnimatePresence>
			{display && (
				<m.div
					drag={isInMove}
					dragMomentum={0}
					onDragEnd={(e) => updatePosition('carhud', e)}
					whileDrag={{ cursor: 'grabbing' }}
					style={{ scale: carhudSize / 100, ...getPosition('carhud') }}
					initial={{ opacity: 0 }}
					animate={{ opacity: 1 }}
					exit={{ opacity: 0 }}
					className='absolute right-6 bottom-0 overflow-hidden'
				>
					{React.createElement(TYPES[carhudStyle] ?? TYPES[1], { vehicleData })}
				</m.div>
			)}
		</AnimatePresence>
	);
}
