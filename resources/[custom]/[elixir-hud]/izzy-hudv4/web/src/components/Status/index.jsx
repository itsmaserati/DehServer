import React, { useState } from 'react';
import Style1 from './Style1';
import Style2 from './Style2';
import { useData } from 'contexts/DataContext';
import Style3 from './Style3';
import Style4 from './Style4';
import Style5 from './Style5';
import { useNuiEvent } from 'hooks/useNuiEvent';
import { motion as m } from 'framer-motion';
import { Location2 } from 'components/Icons';
import { useLang } from 'contexts/LangContext';
import classNames from 'classnames';

const TYPES = {
	1: Style1,
	2: Style2,
	3: Style3,
	4: Style4,
	5: Style5,
};
export default function Status({ isInMove }) {
	const { lang } = useLang();
	const { statusStyle, statusSize, location, mapType, mapVisibility } = useData();
	const [status, setStatus] = useState([
		{
			name: 'health',
			icon: 'health',
			label: 'Health',
			value: 50,
			color: '#FF3535',
		},
		{
			name: 'armor',
			icon: 'armor',
			label: 'Armor',
			value: 50,
			min: 0,
			color: '#004ABA',
		},
		{
			name: 'hunger',
			icon: 'hunger',
			label: 'Hunger',
			value: 50,
			color: '#FFA740',
		},
		{
			name: 'thirst',
			icon: 'thirst',
			label: 'Thirst',
			value: 50,
			color: '#00BAAA',
		},
		{
			name: 'stamina',
			icon: 'stamina',
			label: 'Stamina',
			value: 50,
			color: '#A965FF',
		},
		{
			name: 'mic',
			icon: 'mic',
			label: 'Mic',
			value: 66,
			rangeLabel: 'Normal',
			color: '#FFFFFF',
		},
	]);

	useNuiEvent('setStatus', setStatus);
	return (
		<m.div
			style={{ scale: statusSize / 100 }}
			className={classNames('absolute bottom-2 left-7', {
				'!bottom-[18rem]': location.inVehicle && statusStyle == 2 && mapType == 'square',
				'!bottom-[22rem]': location.inVehicle && statusStyle == 2 && mapType == 'circle',
				'!bottom-72': location.inVehicle && statusStyle == 5 && mapType == 'square',
				'!bottom-80': location.inVehicle && statusStyle == 5 && mapType == 'circle',
			})}
		>
			{statusStyle !== 5 && (
				<div
					style={{ background: 'linear-gradient(90deg, rgba(0, 0, 0, 0.47) 0%, rgba(0, 0, 0, 0) 100%)' }}
					className={classNames('absolute bottom-20 w-[15.1875rem] h-[2.25rem] rounded flex items-center px-[0.5625rem] gap-x-2 transition-all duration-300', {
						'!bottom-[21rem]': (location.inVehicle && mapType == 'circle') || mapVisibility == 'always',
						'!bottom-[17rem]': (location.inVehicle && mapType == 'square') || mapVisibility == 'always',
						'!bottom-[8rem]': !location.inVehicle && statusStyle == 2,
						'!top-[22rem]': location.inVehicle && statusStyle == 2 && mapType == 'square',
						'!top-[25.8rem]': location.inVehicle && statusStyle == 2 && mapType == 'circle',
					})}
				>
					<Location2 />
					<div>
						<p className='text-xs text-white/[.66] font-gr-m leading-3'>{lang.location}</p>
						<p className='text-sm text-white font-gr-sb whitespace-nowrap leading-3'>{location.street}</p>
					</div>
				</div>
			)}
			{React.createElement(TYPES[statusStyle] ?? TYPES[1], { status, isInMove })}
		</m.div>
	);
}
