import React from 'react';
import Fuel from './Fuel';
import SpeedoMeter from './SpeedoMeter';
import Nitro from './Nitro';
import { ABS, Engine, Headlights, LeftSignal, RightSignal, Seatbelt } from 'components/Icons';

export default function Style3({ vehicleData }) {
	return (
		<div className='flex translate-y-12'>
			<Fuel value={vehicleData.fuel} />
			<div className='ml-[.5625rem] flex'>
				<SpeedoMeter vehicleData={vehicleData} />

				<div className='grid grid-cols-3 gap-x-2 h-min absolute right-[2.125rem] top-3'>
					<LeftSignal active={vehicleData.leftSignal} />
					<RightSignal active={vehicleData.rightSignal} />
					<Seatbelt active={vehicleData.seatbelt} />
					<Engine active={vehicleData.engine} />
					<Headlights active={vehicleData.headlights} />
					<ABS active={vehicleData.abs} />
				</div>
			</div>
			<Nitro value={vehicleData.nitrous} />
		</div>
	);
}
