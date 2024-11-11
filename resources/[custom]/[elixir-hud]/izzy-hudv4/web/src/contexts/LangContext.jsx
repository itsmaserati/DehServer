import { createContext, useContext, useState } from 'react';
import { useNuiEvent } from '../hooks/useNuiEvent';

const LangContext = createContext();
export const useLang = () => useContext(LangContext);

export default function LangProvider({ children }) {
	const [lang, setLang] = useState({
		kmh: 'KM/H',
		mph: 'MPH',
		hudSettings: 'HUD SETTINGS',
		chooseSettings: 'CHOOSE SETTINGS',
		statusTypes: 'Status Types',
		statusColors: 'Status Colors',
		statusSize: 'Status Size',
		speedoMeter: 'Speedo Meter',
		speedoMeterSize: 'Speedo Meter Size',
		speedType: 'Speed Type',
		choose: 'Choose',
		saveSettings: 'Save Settings',
		defaultAll: 'Default All',
		cinematicMode: 'Cinematic Mode',
		moveIt: 'Move It',
		pageDescription: 'Lorem ipsum dolor sit amet consectetur. Curabitur nibh quisque dui ut sit consequat. Iaculis et sit ut risus',
		type: 'Type',
		typeDescription: 'Lorem ipsum dolor sit amet consectetur.',
		information: 'Information',
		mapType: 'Map Type',
		circle: 'Circle',
		square: 'Square',
		location: 'Location',
		topInfoStyle: 'Top Info Style',
	});

	useNuiEvent('setLang', setLang);

	return <LangContext.Provider value={{ lang }}>{children}</LangContext.Provider>;
}
