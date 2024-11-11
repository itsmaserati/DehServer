import { createContext, useContext, useEffect, useState } from 'react';
import { useNuiEvent } from '../hooks/useNuiEvent';
import { fetchNui } from 'utils/fetchNui';

const DataContext = createContext();
export const useData = () => useContext(DataContext);

export default function DataProvider({ children }) {
	const [config, setConfig] = useState({
		serverNameBold: 'IZZY',
		serverName: 'SHOP',
		notifyPosition: 'top-left',
		useRealTime: false,
		colors: {
			primary: '#FF5656',
			purple: {
				primary: '#B04AFF',
				secondary: '#672D95',
			},
			pink: {
				primary: '#FB32FF',
				secondary: '#912E93',
			},
			green: {
				primary: '#78FC4A',
				secondary: '#49962E',
			},
			lightgreen: {
				primary: '#A7FFDF',
				secondary: '#4AFCBC',
			},
			white: {
				primary: '#FFFFFF',
				secondary: '#999999',
			},
			red: {
				primary: '#FF4A4A',
				secondary: '#9B2F2F',
			},
			yellow: {
				primary: '#FFCA0F',
				secondary: '#A38931',
			},
			darkblue: {
				primary: '#95ADFF',
				secondary: '#4A72FC',
			},
			lightblue: {
				primary: '#9CE2FF',
				secondary: '#4AC7FC',
			},
			brown: {
				primary: '#FFAA7A',
				secondary: '#FC8A4A',
			},
		},
	});
	const [data, setData] = useState({
		statusStyle: 2,
		topInfoStyle: 1,
		carhudStyle: 1,
		statusSize: 100,
		carhudSize: 100,
		speedType: 'kmh',
		mapType: 'square',
		cinematic: false,
	});
	const [location, setLocation] = useState({
		direction: 'SA',
		street: 'tendim sokagi',
		inVehicle: true,
	});
	const [time, setTime] = useState('00:00');

	const update = (val) => setData((prev) => ({ ...prev, ...val }));
	useNuiEvent('updateSettings', update);
	useNuiEvent('setSettings', setData);
	useNuiEvent('setConfig', setConfig);
	useNuiEvent('setLocation', setLocation);
	useNuiEvent('setTime', setTime);

	const updatePosition = (key, e) =>
		localStorage.setItem(
			key,
			JSON.stringify({
				x: e.layerX - e.offsetX,
				y: e.layerY - e.offsetY,
			})
		);
	const getPosition = (key) => {
		return JSON.parse(localStorage.getItem(key));
	};

	return <DataContext.Provider value={{ ...data, ...config, data, location, time, update, updatePosition, getPosition }}>{children}</DataContext.Provider>;
}
