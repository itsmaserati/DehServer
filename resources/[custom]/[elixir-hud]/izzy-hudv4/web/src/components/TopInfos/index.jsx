import React, { useEffect, useState } from 'react';
import Style1 from './Style1';
import { useData } from 'contexts/DataContext';
import Style2 from './Style2';
import { useNuiEvent } from 'hooks/useNuiEvent';

const TYPES = {
	1: Style1,
	2: Style2,
};
export default function TopInfos({ isInMove }) {
	const { topInfoStyle } = useData();
	const [weapon, setWeapon] = useState({ name: 'WEAPON_PISTOL', label: 'Pistol', total: 100, current: 15 });
	const [infos, setInfos] = useState([
		{
			id: 'fullname',
			value: 'Brenden Randall',
			secondValue: '[2562]',
			header: true,
		},
		{
			id: 'job',
			value: 'Police Officer II',
		},
		{
			id: 'bank',
			icon: 'bank',
			value: '237000',
			currency: true,
			color: '#56FFC2',
		},
		{
			id: 'cash',
			icon: 'cash',
			value: '56000',
			currency: true,
			color: '#56FF67',
		},
	]);

	useNuiEvent('setTopInfos', setInfos);
	useNuiEvent('setWeapon', (val) => {
		if (!isInMove) setWeapon(val);
	});

	useEffect(() => {
		if (!isInMove) return;

		setWeapon({ name: 'WEAPON_PISTOL', label: 'Pistol', total: 100, current: 15 });
	}, [isInMove]);
	return <div className='absolute right-[2.8125rem] top-[2.8125rem]'>{React.createElement(TYPES[topInfoStyle] ?? TYPES[1], { infos, weapon, isInMove })}</div>;
}
