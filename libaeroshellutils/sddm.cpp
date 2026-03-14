/*
 *  SPDX-FileCopyrightText: 2026 catpswin56 <catpswin5@proton.me>
 *
 *  SPDX-License-Identifier: AGPL-3.0-or-later
 */

#include "sddm.h"

#include <KConfigGroup>

SDDM::SDDM(QObject *parent)
    : QObject(parent)
    , m_cfg{KSharedConfig::openConfig("/etc/sddm.conf.d/kde_settings.conf")}
{
    KConfigGroup group = m_cfg->group("Theme");
    m_currentSDDMTheme = group.readEntry("Current", "sddm-theme-mod");
}

SDDM::~SDDM() = default;


QString SDDM::currentSDDMTheme()
{ return m_currentSDDMTheme; }

#include "moc_sddm.cpp"
